#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
INSERTED=$((INSERTED+0))
echo $($PSQL "TRUNCATE TABLE games, teams")

# year,round,winner,opponent,winner_goals,opponent_goals
cat games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $YEAR != "year" ]]
  then

    # Get WINNER_ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $WINNER_ID ]]
    then
      WINNER_ID_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      
      if [[ $WINNER_ID_INSERT == "INSERT 0 1" ]]
      then
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        echo Inserted team $WINNER : $WINNER_ID
      fi
    fi

    # Get OPPONENT_ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $OPPONENT_ID_INSERT == "INSERT 0 1" ]]
      then
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
        echo Inserted team $OPPONENT: $OPPONENT_ID
      fi
    fi

    GAMES_INSERTED=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $GAMES_INSERTED == "INSERT 0 1" ]]    
    then
      INSERTED=$((INSERTED+1))
      echo -e "Games Inserted $INSERTED\n"
    fi
  
  fi
  
done
