CREATE DATABASE Ristorante

CREATE TABLE Tavolo
(
  Numero_tavolo INT PRIMARY KEY,
  Tipo_tavolo VARCHAR(50),
  Numero_persone INT
);

CREATE TABLE Cliente
(
  Codice_fiscale VARCHAR(16) PRIMARY KEY,
  Nome VARCHAR(50),
  Cognome VARCHAR(50),
  Numero_telefono VARCHAR(20),
  Email VARCHAR(50),
  Numero_tavolo INT,
  FOREIGN KEY (Numero_tavolo) REFERENCES Tavolo(Numero_tavolo)
);

CREATE TABLE Ordine
(
  Numero_ordine INT,
  Data DATE,
  Ora TIME,
  Piatti_ordinati VARCHAR(255),
  Quantita INT,
  Totale DECIMAL(10,2),
  Numero_tavolo INT,
  PRIMARY KEY (Numero_ordine, Data, Ora),
  FOREIGN KEY (Numero_tavolo) REFERENCES Tavolo (Numero_tavolo)
);

CREATE TABLE Fornitore
(
  ID_fornitore INT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Cognome VARCHAR(50) NOT NULL,
  Indirizzo VARCHAR(255) NOT NULL,
  Numero_telefono VARCHAR(20),
  Email VARCHAR(255)
);

CREATE TABLE Menu
(
  ID_menu INT PRIMARY KEY,
  Nome VARCHAR(50),
  Prezzo DECIMAL(6,2),
  Descrizione VARCHAR(255),
  Selettore BOOLEAN
);

CREATE TABLE Ingrediente
(
  ID_ingrediente INT PRIMARY KEY,
  Nome VARCHAR(50),
  Prezzo DECIMAL(6,2),
);

CREATE TABLE Inventario
(
  Codice INT PRIMARY KEY,
  Descrizione VARCHAR(255),
  Disponibilita INT,
  ID_fornitore INT,
  ID_ingrediente INT,
  FOREIGN KEY (ID_fornitore) REFERENCES Fornitore(ID_fornitore),
  FOREIGN KEY (ID_ingrediente) REFERENCES Ingrediente(ID_ingrediente)
);

CREATE TABLE Dipendente
(
  ID_dipendente INT PRIMARY KEY,
  Numero_Telefono VARCHAR(20),
  Nome VARCHAR(50),
  Cognome VARCHAR(50),
  Stipendio DECIMAL(10, 2),
  Selettore BOOLEAN,
  Numero_ordini_svolti INT,
  Ruolo VARCHAR(50)
);

CREATE TABLE Prenotazioni
(
  ID_prenotazioni INT NOT NULL,
  Nome_cliente VARCHAR(255) NOT NULL,
  Telefono_cliente VARCHAR(20) NOT NULL,
  Data_prenotazione DATE NOT NULL,
  Ora_prenotazione TIME NOT NULL,
  Numero_persone INT NOT NULL,
  Codice_fiscale VARCHAR(16) NOT NULL,
  Numero_tavolo INT NOT NULL,
  PRIMARY KEY (ID_prenotazioni),
  FOREIGN KEY (Codice_fiscale) REFERENCES Cliente(Codice_fiscale),
  FOREIGN KEY (Numero_tavolo) REFERENCES Tavolo(Numero_tavolo)
);

CREATE TABLE Ordinazione
(
  Codice_fiscale VARCHAR(16) NOT NULL,
  Numero_ordine INT NOT NULL,
  Data DATE,
  Ora TIME,
  PRIMARY KEY (Codice_fiscale, Numero_ordine),
  FOREIGN KEY (Codice_fiscale) REFERENCES Cliente(Codice_fiscale),
  FOREIGN KEY (Numero_ordine, Data, Ora) REFERENCES Ordine(Numero_ordine, Data, Ora)
);

CREATE TABLE Lavorazione
(
  Numero_ordine INT NOT NULL,
  ID_dipendente INT NOT NULL,
  Data DATE,
  Ora TIME,
  PRIMARY KEY (Numero_ordine, ID_dipendente, Data, Ora),
  FOREIGN KEY (Numero_ordine, Data, Ora) REFERENCES Ordine(Numero_ordine, Data, Ora),
  FOREIGN KEY (ID_dipendente) REFERENCES Dipendente(ID_dipendente)
);

CREATE TABLE Porzioni
(
  ID_ingrediente INT NOT NULL,
  ID_menu INT NOT NULL,
  Quantita INT NOT NULL,
  PRIMARY KEY (ID_ingrediente, ID_menu),
  FOREIGN KEY (ID_ingrediente) REFERENCES Ingrediente(ID_ingrediente),
  FOREIGN KEY (ID_menu) REFERENCES Menu(ID_menu)
);

CREATE TABLE Dettaglio_Ordine
(
  Numero_ordine INT NOT NULL,
  Data DATE,
  Ora TIME,
  ID_menu INT NOT NULL,
  Quantita INT NOT NULL,
  Totale INT NOT NULL,
  FOREIGN KEY (Numero_ordine, Data, ora) REFERENCES Ordine(Numero_ordine, Data, Ora),
  FOREIGN KEY (ID_menu) REFERENCES Menu(ID_menu)
);




