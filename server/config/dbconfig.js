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

module.exports = connection ;