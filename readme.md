## long post support
### can be splitted into many micro post
### can combine as one post when show
### markdown support
### can show convosation

## tag management
### my tags (linux)
### manage similar tags(linux -> debian, gnome, debian_cn)

## tag index view
### show convosation
### long post with convosations
### fetch more can show unfollowing user's post with the tag;



curl -i -X PUT -d "user[email]=exuser5@mail.com" --header "Authorization: Token token=bwBmIbJwjFwRBkS4NyfHmhAzQSaB3gwGV+S+fTiMJ7MQ5IYvZry7+TGsXmsxE+8+plc6iE3oUaBelWMaFfKcgA==, name=ExUser-5" http://localhost:3000//api/v1/users/6

curl -i -X PUT -d "user[email]=fadeuser@mail.com" --header "Authorization: Token token=validtoken, name=ExUser-5" http://localhost:3000//api/v1/users/6
