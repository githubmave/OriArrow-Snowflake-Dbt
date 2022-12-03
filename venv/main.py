import snowflake.connector as sf
import boto3
from snowflake.connector.pandas_tools import write_pandas
import pandas as pd


service_name='s3'
region_name='us-east-1'
aws_access_key_id='AKIA3ETKH4USEOYR6YPW'
aws_secret_access_key='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 secret access key'

s3=boto3.resource(
  service_name=service_name,
  region_name=region_name,
  aws_access_key_id=aws_access_key_id,
  aws_secret_access_key=aws_secret_access_key

)

user='snowmave'
password='Bigo6910'
account='mg61153.ap-south-1.aws'
database='RAMU'
warehouse='COMPUTE_WH'
schema='PUBLIC'
role='SYSADMIN'



conn=sf.connect(user=user,password=password,account=account)

def run_query(connection,query):
  cursor=conn.cursor();
  cursor.execute(query);
  cursor.close();


statement_1='use warehouse'+warehouse;
# statement2='alter warehouse'+warehouse +"resume";
statement3="use database" + database;
statement4="use role" + role;

run_query(conn,statement_1)
# run_query(conn,statement2)
run_query(conn,statement3)
run_query(conn,statement4)

for obj in s3.Bucket('demoshow3').objects.all():
  df=pd.read_csv(obj.get()['Body'])
  df.columns=['SEPALLENGTH','SEPALWIDTH','PETALLENGTH','PETALWIDTH','CLASSNAME'];
  write_pandas(conn,df,'VIDEO')
  print(df)
 

""" import snowflake.connector
#get the version

ctx=snowflake.connector.connect(
  user='snowmave',
  password='Bigo6910',
  account='mg61153.ap-south-1.aws'

)

cs=ctx.cursor()

try:
    cs.execute("SELECT current_version()")
    one_row = cs.fetchone()
    print(one_row[0])


finally:
    cs.close()
ctx.close()    """
 
""" print("hellow Ori-arrow") """
