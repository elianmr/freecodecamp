#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ SALON MASTER ~~~~~\n"
echo -e "Welcome to SALON MASTER, how can I help you?\n"

MAIN_MENU(){  
SERVICES=$($PSQL "SELECT service_id, name FROM services")
echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
  echo -e "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED

SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
# if service does not exist
if [[ -z $SERVICE_ID ]]
then
  # return to MAIN_MENU
  MAIN_MENU "I could not find that service. What would you like today?"
else
  # request customer data
  REQUEST_DATA
fi

}
REQUEST_DATA(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  # if customer does not exist
  if [[ -z $CUSTOMER_ID ]]
  then
    
    # get customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    VARIABLE=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    
    # get customer_id after inserted    
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    SET_APPOINTMENT $CUSTOMER_ID $SERVICE_ID $SERVICE_NAME
  
  else
  
    SET_APPOINTMENT $CUSTOMER_ID $SERVICE_ID $SERVICE_NAME
  
  fi

}
SET_APPOINTMENT(){ # $1 = $CUSTOMER_ID , $2 = $SERVICE_ID , $3 = $SERVICE_NAME
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $1")
  echo -e "\nWhat time would you like your $3, $CUSTOMER_NAME?"
  read SERVICE_TIME

  APPOINTMENT_INSERTED=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($1,$2,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $3 at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}
MAIN_MENU
