--Procedure utili
CREATE PROCEDURE CalcolaTotaleOrdine (IN numero_ordine INT)
BEGIN
    DECLARE totale DECIMAL(10,2);
    SELECT SUM(Totale) INTO totale
    FROM Dettaglio_Ordine
    WHERE Numero_ordine = numero_ordine;
    UPDATE Ordine SET Totale = totale WHERE Numero_ordine = numero_ordine;
END;

CREATE PROCEDURE ContaPrenotazioniGiorno (IN data_prenotazione DATE, OUT num_prenotazioni INT)
BEGIN
    SELECT COUNT(*) INTO num_prenotazioni
    FROM Prenotazioni
    WHERE Data_prenotazione = data_prenotazione;
END;

--Procedure di inseriemento
CREATE PROCEDURE insert_tavolo(
    IN num_tavolo INT,
    IN tipo_tavolo VARCHAR(50),
    IN num_persone INT
)
BEGIN
    INSERT INTO Tavolo(Numero_tavolo, Tipo_tavolo, Numero_persone)
    VALUES(num_tavolo, tipo_tavolo, num_persone);
END;

CREATE PROCEDURE insert_cliente(
    IN codice_fiscale VARCHAR(16),
    IN nome VARCHAR(50),
    IN cognome VARCHAR(50),
    IN num_telefono VARCHAR(20),
    IN email VARCHAR(50),
    IN num_tavolo INT
)
BEGIN
    INSERT INTO Cliente(Codice_fiscale, Nome, Cognome, Numero_telefono, Email, Numero_tavolo)
    VALUES(codice_fiscale, nome, cognome, num_telefono, email, num_tavolo);
END;

CREATE PROCEDURE insert_ordine(
    IN num_ordine INT,
    IN data DATE,
    IN ora TIME,
    IN piatti_ordinati VARCHAR(255),
    IN quantita INT,
    IN totale DECIMAL(10,2),
    IN num_tavolo INT
)
BEGIN
    INSERT INTO Ordine(Numero_ordine, Data, Ora, Piatti_ordinati, Quantita, Totale, Numero_tavolo)
    VALUES(num_ordine, data, ora, piatti_ordinati, quantita, totale, num_tavolo);
END;

CREATE PROCEDURE insert_fornitore(
    IN id_fornitore INT,
    IN nome VARCHAR(50),
    IN cognome VARCHAR(50),
    IN indirizzo VARCHAR(255),
    IN num_telefono VARCHAR(20),
    IN email VARCHAR(255)
)
BEGIN
    INSERT INTO Fornitore(ID_fornitore, Nome, Cognome, Indirizzo, Numero_telefono, Email)
    VALUES(id_fornitore, nome, cognome, indirizzo, num_telefono, email);
END;

CREATE PROCEDURE insert_menu(
    IN id_menu INT,
    IN nome VARCHAR(50),
    IN prezzo DECIMAL(6,2),
    IN descrizione VARCHAR(255),
    IN selettore BOOLEAN
)
BEGIN
    INSERT INTO Menu(ID_menu, Nome, Prezzo, Descrizione, Selettore)
    VALUES(id_menu, nome, prezzo, descrizione, selettore);
END;

CREATE PROCEDURE insert_ingrediente(
    IN id_ingrediente INT,
    IN nome VARCHAR(50),
    IN prezzo DECIMAL(6,2)
)
BEGIN
    INSERT INTO Ingrediente(ID_ingrediente, Nome, Prezzo)
    VALUES(id_ingrediente, nome, prezzo);
END;

CREATE PROCEDURE insert_Dipendente
    (
    IN ID_dipendente INT,
    IN Numero_Telefono VARCHAR(20),
    IN Nome VARCHAR(50),
    IN Cognome VARCHAR(50),
    IN Stipendio DECIMAL(10, 2),
    IN Selettore BOOLEAN,
    IN Numero_ordini_svolti INT,
    IN Ruolo VARCHAR(50)
)
BEGIN
    INSERT INTO Dipendente
        (ID_dipendente, Numero_Telefono, Nome, Cognome, Stipendio, Selettore, Numero_ordini_svolti, Ruolo)
    VALUES
        (ID_dipendente, Numero_Telefono, Nome, Cognome, Stipendio, Selettore, Numero_ordini_svolti, Ruolo);
END;

CREATE PROCEDURE insert_DettaglioOrdine
    (
    IN Numero_ordine INT,
    IN Data DATE,
    IN Ora TIME,
    IN ID_menu INT,
    IN Quantita INT,
    IN Totale INT
)
BEGIN
    INSERT INTO Dettaglio_Ordine
        (Numero_ordine, Data, Ora, ID_menu, Quantita, Totale)
    VALUES
        (Numero_ordine, Data, Ora, ID_menu, Quantita, Totale);
END;

CREATE PROCEDURE insert_Ordinazione
    (
    IN Codice_fiscale VARCHAR(16),
    IN Numero_ordine INT,
    IN Data DATE,
    IN Ora TIME
)
BEGIN
    INSERT INTO Ordinazione
        (Codice_fiscale, Numero_ordine, Data, Ora)
    VALUES
        (Codice_fiscale, Numero_ordine, Data, Ora);
END;

CREATE PROCEDURE insert_Porzioni
    (
    IN ID_ingrediente INT,
    IN ID_menu INT,
    IN Quantita INT
)
BEGIN
    INSERT INTO Porzioni
        (ID_ingrediente, ID_menu, Quantita)
    VALUES
        (@ID_ingrediente, @ID_menu, @Quantita);
END;


CREATE PROCEDURE insert_Lavorazione
    (
    IN Numero_ordine INT,
    IN ID_dipendente INT,
    IN Data DATE,
    IN Ora TIME
)
BEGIN
    INSERT INTO Lavorazione
        (Numero_ordine, ID_dipendente, Data, Ora)
    VALUES
        (Numero_ordine, ID_dipendente, Data, Ora);
END;

CREATE PROCEDURE insert_Inventario
(
  IN Codice INT,
  IN Descrizione VARCHAR(255),
  IN Disponibilita INT,
  IN ID_fornitore INT,
  IN ID_ingrediente INT
)
BEGIN
  INSERT INTO Inventario(Codice, Descrizione, Disponibilita, ID_fornitore, ID_ingrediente)
  VALUES (Codice, Descrizione, Disponibilita, ID_fornitore, ID_ingrediente);
END;

CREATE PROCEDURE insert_Prenotazione
(
  IN ID_prenotazione INT,
  IN Nome_cliente VARCHAR(255),
  IN Telefono_cliente VARCHAR(20),
  IN Data_prenotazione DATE,
  IN Ora_prenotazione TIME,
  IN Numero_persone INT,
  IN Codice_fiscale VARCHAR(16),
  IN Numero_tavolo INT
)
BEGIN
  INSERT INTO Prenotazioni(ID_prenotazioni, Nome_cliente, Telefono_cliente, Data_prenotazione, Ora_prenotazione, Numero_persone, Codice_fiscale, Numero_tavolo)
  VALUES (ID_prenotazione, Nome_cliente, Telefono_cliente, Data_prenotazione, Ora_prenotazione, Numero_persone, Codice_fiscale, Numero_tavolo);
END;

--Procedure per l'aggiornamento
CREATE PROCEDURE aggiornaTavolo
(
  IN numeroTavolo INT,
  IN tipoTavolo VARCHAR(50),
  IN numeroPersone INT
)
BEGIN
  UPDATE Tavolo SET Tipo_tavolo = tipoTavolo, Numero_persone = numeroPersone
  WHERE Numero_tavolo = numeroTavolo;
END;

CREATE PROCEDURE aggiornaCliente
(
  IN codiceFiscale VARCHAR(16),
  IN nome VARCHAR(50),
  IN cognome VARCHAR(50),
  IN numeroTelefono VARCHAR(20),
  IN email VARCHAR(50),
  IN numeroTavolo INT
)
BEGIN
  UPDATE Cliente SET Nome = nome, Cognome = cognome, Numero_telefono = numeroTelefono, Email = email, Numero_tavolo = numeroTavolo
  WHERE Codice_fiscale = codiceFiscale;
END;

CREATE PROCEDURE aggiornaOrdine
(
  IN numeroOrdine INT,
  IN data DATE,
  IN ora TIME,
  IN piattiOrdinati VARCHAR(255),
  IN quantita INT,
  IN totale DECIMAL(10,2),
  IN numeroTavolo INT
)
BEGIN
  UPDATE Ordine SET Piatti_ordinati = piattiOrdinati, Quantita = quantita, Totale = totale, Numero_tavolo = numeroTavolo
  WHERE Numero_ordine = numeroOrdine AND Data = data AND Ora = ora;
END;

CREATE PROCEDURE aggiornaFornitore
(
  IN idFornitore INT,
  IN nome VARCHAR(50),
  IN cognome VARCHAR(50),
  IN indirizzo VARCHAR(255),
  IN numeroTelefono VARCHAR(20),
  IN email VARCHAR(255)
)
BEGIN
  UPDATE Fornitore SET Nome = nome, Cognome = cognome, Indirizzo = indirizzo, Numero_telefono = numeroTelefono, Email = email
  WHERE ID_fornitore = idFornitore;
END;

CREATE PROCEDURE aggiornaMenu
(
  IN idMenu INT,
  IN nome VARCHAR(50),
  IN prezzo DECIMAL(6,2),
  IN descrizione VARCHAR(255),
  IN selettore BOOLEAN
)
BEGIN
  UPDATE Menu SET Nome = nome, Prezzo = prezzo, Descrizione = descrizione, Selettore = selettore
  WHERE ID_menu = idMenu;
END;

CREATE PROCEDURE aggiornaInventario
(
  IN codice INT,
  IN descrizione VARCHAR(255),
  IN disponibilita INT,
  IN idFornitore INT,
  IN idIngrediente INT
)
BEGIN
  UPDATE Inventario SET Descrizione = descrizione, Disponibilita = disponibilita, ID_fornitore = idFornitore
  WHERE Codice = codice;
  
  UPDATE Ingrediente SET Codice = codice
  WHERE ID_ingrediente = idIngrediente;
END;

CREATE PROCEDURE aggiornaDettaglioOrdine
(
    IN numero_ordine INT,
    IN data DATE,
    IN ora TIME,
    IN id_menu INT,
    IN quantita INT,
    IN totale INT
)
BEGIN
    UPDATE Dettaglio_Ordine
    SET Quantita = quantita,
      Totale = totale
    WHERE Numero_ordine = numero_ordine AND Data = data AND Ora = ora AND ID_menu = id_menu;
END;

CREATE PROCEDURE aggiornaPrenotazione
(
    IN id_prenotazione INT,
    IN numero_tavolo INT
)
BEGIN
  UPDATE Prenotazioni
  SET Numero_tavolo = numero_tavolo
  WHERE ID_prenotazioni = id_prenotazione;
END;

CREATE PROCEDURE aggiornaLavorazione
(
    IN numero_ordine INT,
    IN id_dipendente INT,
    IN data DATE,
    IN ora TIME,
    IN numero_ordini_svolti INT
)
BEGIN
  UPDATE Lavorazione
  SET Numero_ordini_svolti = numero_ordini_svolti
  WHERE Numero_ordine = numero_ordine AND ID_dipendente = id_dipendente AND Data = data AND Ora = ora;
END;

CREATE PROCEDURE aggiornaOrdinazione
(
    IN numero_ordine INT,
    IN data DATE,
    IN ora TIME,
    IN piatti_ordinati VARCHAR(255),
    IN quantita INT,
    IN totale DECIMAL(10,2)
)
BEGIN
  UPDATE Ordine
  SET Piatti_ordinati = piatti_ordinati,
      Quantita = quantita,
      Totale = totale
  WHERE Numero_ordine = numero_ordine AND Data = data AND Ora = ora;
END;

CREATE PROCEDURE aggiornaDipendente
(
    IN id_dipendente INT,
    IN numero_ordini_svolti INT,
    IN ruolo VARCHAR(50)
)
BEGIN
  UPDATE Dipendente
  SET Numero_ordini_svolti = numero_ordini_svolti,
      Ruolo = ruolo
  WHERE ID_dipendente = id_dipendente;
END;

CREATE PROCEDURE aggiornaPorzioni
(
    IN id_ingrediente INT,
    IN id_menu INT,
    IN quantita INT
)
BEGIN
  UPDATE Porzioni
  SET Quantita = quantita
  WHERE ID_ingrediente = id_ingrediente AND ID_menu = id_menu;
END;

CREATE PROCEDURE aggiornaIngrediente
(
    IN id_ingrediente INT,
    IN nome VARCHAR(50),
    IN prezzo DECIMAL(6,2)
)
BEGIN
  UPDATE Ingrediente
  SET Nome = nome,
      Prezzo = prezzo
  WHERE ID_ingrediente = id_ingrediente;
END;