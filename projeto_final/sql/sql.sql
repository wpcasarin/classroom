USE library;
CREATE TABLE users (
  u_cod INT AUTO_INCREMENT PRIMARY KEY,
  u_name VARCHAR(30) NOT NULL,
  u_email VARCHAR(30) NOT NULL,
  u_cpf VARCHAR(11) NOT NULL,
  u_passwd VARCHAR(15) DEFAULT '12345' NOT NULL,
  u_img MEDIUMBLOB,
  u_reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE books (
  b_cod INT AUTO_INCREMENT PRIMARY KEY,
  b_name VARCHAR(30) NOT NULL,
  b_author VARCHAR(30) NOT NULL,
  b_quant INT(6) DEFAULT 0,
  b_reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE loan (
  l_cod INT AUTO_INCREMENT,
  u_cod INT,
  b_cod INT,
  date_borrow DATE,
  date_return DATE,
  PRIMARY KEY (l_cod, b_cod, u_cod),
  FOREIGN KEY (u_cod) REFERENCES users (u_cod),
  FOREIGN KEY (b_cod) REFERENCES books (b_cod)
);
INSERT INTO
  users (u_name, u_email, u_passwd, u_cpf) VALUE ('Administrador', 'admin', 'admin', '000');