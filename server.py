import psycopg2
from psycopg2 import sql, connect
from bottle import Bottle, template, run, request
import os
import logging
import re
import json
import pandas as pd
import plotly.express as px

app = Bottle()


fmt = "%(levelname)s\t%(funcName)s():%(lineno)i\t%(message)s"
logging.basicConfig(level=logging.DEBUG, format=fmt)
logger = logging.getLogger(__name__)


@app.route('/')
def search_list():
    return template('search')





@app.route('/result', method=['GET','POST'])
def result_list():
    pw = os.getenv(r'PW')
    usr = os.getenv(r'DB_USR')
    conn = psycopg2.connect(
        host="localhost",
        dbname='postgres',
        user=usr,
        port='5432',
        password=pw
    )

     #checking everything filterd for or against as well as sorted by 
    red_checked = request.forms.get('filter_red') 
    violet_checked = request.forms.get('filter_violet') 
    cardtype = request.forms.get('cardtype')  
    name_contains = request.forms.get('name_contains')  
    text_contains = request.forms.get('text_contains')  
    cost_relative = request.forms.get('relative_cost')  #null if left blank
    cost_amount = request.forms.get('amount_cost') #null if left blank
    strength_relative = request.forms.get('relative_strength')  #null if left blank
    strength_amount = request.forms.get('amount_strength') #null if left blank
    health_relative = request.forms.get('relative_health')  #null if left blank
    health_amount = request.forms.get('amount_health') #null if left blank


    # Start building the query
    query = 'SELECT * FROM "BFB".bfbcards'
    conditions = []
    params = []

    # Add filters dynamically
    if red_checked:
        conditions.append('red = %s')
        params.append('TRUE')

    if violet_checked:
        conditions.append('violet = %s')
        params.append('TRUE')

    if cardtype and cardtype != 'all':#not tested on weather it works or not
        conditions.append('card_type = %s')
        params.append(cardtype)

    if name_contains:
        conditions.append('LOWER(card_name) LIKE %s')#not tested on weather it works or not
        params.append(f"%{name_contains.lower()}%")

    if text_contains:
        conditions.append('LOWER(card_text) LIKE %s')
        params.append(f"%{text_contains.lower()}%")

    add_numeric_filter('mana_cost', cost_relative, cost_amount, conditions, params)
    add_numeric_filter('strength', strength_relative, strength_amount, conditions, params)
    add_numeric_filter('health', health_relative, health_amount, conditions, params)
    
    # Combine query with conditions
    if conditions:
        query += ' WHERE ' + ' AND '.join(conditions)

    # Execute
    cursor = conn.cursor()
    cursor.execute(query, tuple(params))
    rows = cursor.fetchall()
    output = template('result', rows=rows)
    return output

def add_numeric_filter(field, relative, amount, conditions, params):
    if relative and amount and amount.isdigit():
        if relative == 'greater than':
            conditions.append(f"({field} ~ '^[0-9]+$' AND CAST({field} AS INTEGER) > %s)")
        elif relative == 'less than':
            conditions.append(f"({field} ~ '^[0-9]+$' AND CAST({field} AS INTEGER) < %s)")
        elif relative == 'equal to':
            conditions.append(f"({field} ~ '^[0-9]+$' AND CAST({field} AS INTEGER) = %s)")
        params.append(int(amount))


@app.route('/upload', method=['GET','POST'])
def upload_list():
    if request.POST:

        deck_name = request.forms.get('deck_name')
          
        #braty input formats wrong and needs to be corrected
        decklistsubmit = request.forms.decklist.strip()
        decklistsubmit = repr(decklistsubmit) #makes all of the \n visible so 
        decklistsubmit =  decklistsubmit.replace('\\r','') #gets rid of the \r that is actualy\\r that decids to appear for no reason
        logger.debug(decklistsubmit)
        decklistsubmitarray =  decklistsubmit.split('\\n') #finaly actualys splits the string itno arrays based on line
        decklistsubmitarray[0] = decklistsubmitarray[0][1:len(decklistsubmitarray[0])] #braty ' needs to be corrected
        decksize = len(decklistsubmitarray)-1
        decklistsubmitarray[decksize] =  decklistsubmitarray[decksize][0:len(decklistsubmitarray[decksize])-1]  #braty ' needs to be corrected 
         
        

        pw = os.getenv(r'PW')
        usr = os.getenv(r'DB_USR')
        conn = psycopg2.connect(
            host="localhost",
            dbname='postgres',
            user=usr,
            port='5432',
            password=pw
        )

        cursor = conn.cursor()
         #cursor.execute('TRUNCATE "BFB".testdecklist;') #if your going to add to a decklist do that somehwere else 

        #gets all of that inputed data into the decklist table 

        

        #inserts card into the newly created deck
        cmd_insert_card = sql.SQL(
            'INSERT INTO {}.{} (card_name, card_id) VALUES (%s,%s);'
        ).format(
            sql.Identifier('BFB'),           # Schema name
            sql.Identifier(deck_name)   # Table name
        )


        #adds the deck to the list of every deck ever
        cmd_add_deck_to_list ='INSERT INTO "BFB".alldecks (deck_name) VALUES (%s);'

        #actually creates the deck
        cmd_create_deck = sql.SQL('''
            CREATE TABLE IF NOT EXISTS {}.{} (
                id SERIAL PRIMARY KEY,
                card_name VARCHAR,
                card_id VARCHAR
            );
        ''').format(
            sql.Identifier('BFB'),         # schema name
            sql.Identifier(deck_name)      # table name
        )


        #after the card has been found by name this finds the id afterwords
        cmd_find_id = sql.SQL('SELECT card_id FROM "BFB".bfbcards WHERE card_name = %s;')

        
        cursor.execute(cmd_create_deck)
        
        cursor.execute(cmd_add_deck_to_list, (deck_name,))
        conn.commit()

        for x in decklistsubmitarray:
            match = re.match(r'^(\d+)(?=\s)',x)
            quantity = int(match.group(1))
            #quantity = int(x[0:1])
            match2 = re.match(r'^(\d+)\s', x)
            cardname= x[match2.end():]
            #cardname = x[2:len(x)]

            # get id
            cursor.execute(cmd_find_id,(cardname,))
            idget = cursor.fetchone()
            logger.debug(idget[0])
            cardid = idget[0]


            #adds the card to the list an number of times equal to the quantity given 
            x = 0
            while x< quantity:
                cursor.execute(cmd_insert_card, (cardname,cardid))
                #cursor.execute(cmd_insert_card, (cardname,quantity))
                x=x+1
        conn.commit()


        output = template('upload')
        return output   
    else:
        output = template('upload')
        return output    


@app.route('/decks')
def upload_list():
    return template('decks')


@app.route('/decks_result', method=['GET','POST'])
def upload_list():
    pw = os.getenv(r'PW')
    usr = os.getenv(r'DB_USR')
    conn = psycopg2.connect(
        host="localhost",
        dbname='postgres',
        user=usr,
        port='5432',
        password=pw
    )
    deck_name = request.forms.get('deck_name_search')  









    #gets the full list of the cards joined iwht the talbe     
    cmd_select_deck = sql.SQL(
        '''
        SELECT d.card_name, c.*
        FROM {}.{} AS d
        LEFT JOIN {}.{} AS c
        ON d.card_id = c.card_id;
        '''
    ).format(
        sql.Identifier('BFB'),              # Schema name for deck
        sql.Identifier(deck_name),          # Deck table
        sql.Identifier('BFB'),              # Schema name for bfbcards (same schema assumed)
        sql.Identifier('bfbcards')          # bfbcards table
    )

    cursor = conn.cursor()
    cursor.execute(cmd_select_deck)
    rows = cursor.fetchall()

    # Create Plotly chart
    query = sql.SQL(
        '''
        SELECT d.card_name, c.mana_cost
        FROM {}.{} AS d
        LEFT JOIN {}.{} AS c
        ON d.card_id = c.card_id
        GROUP BY d.card_name, c.mana_cost;
        '''
).format(
    sql.Identifier('BFB'),             
    sql.Identifier(deck_name),         
    sql.Identifier('BFB'),             
    sql.Identifier('bfbcards')         
)
    df = pd.read_sql_query(query.as_string(conn), conn)
    df_grouped = df.groupby('mana_cost').size().reset_index(name='count')
    fig = px.bar(
        df_grouped, 
        x='mana_cost', 
        y='count', 
        title='Manacurving it'
    )
    chart_html = fig.to_html(full_html=False)

    
    return template('decks_result',rows=rows,plot=chart_html)



@app.route('/rules')
def upload_list():
    return template('rules')

@app.route('/wife')
def upload_list():
    return template('wife')


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, reloader=True)