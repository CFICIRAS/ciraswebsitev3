const mysql= require ('mysql')

const connection = mysql.createPool ({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'cficiras_website'
  });
 
function getConnection() {
    return connection;
}

connection.getConnection((err, connection) => {
  if (err) throw err; // not connected
  console.log('Base de donnée connecté!');
});

module.exports = connection ;