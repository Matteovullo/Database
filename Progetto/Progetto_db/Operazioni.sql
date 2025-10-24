--Op1
INSERT INTO Tavolo (Numero_tavolo, Tipo_tavolo, Numero_persone)
VALUES (1, 'Interno', 5);

INSERT INTO Cliente (Codice_fiscale, Nome, Cognome, Numero_telefono, Email, Numero_tavolo)
VALUES ('ABCDEF12G34H567I', 'Mario', 'Rossi', '3331234567','mariorossi@gmal.com', 1);

--Op2
INSERT INTO Dipendente (ID_Dipendente, Numero_Telefono, Nome, Cognome, Stipendio, Selettore, Ruolo)
VALUES (1, '1234567890', 'Mario', 'Rossi', 2000.00, 1, 'Chef');

--Op3
INSERT INTO Menu(ID_menu, Nome, Prezzo, Descrizione, Selettore)
VALUES(1, 'Pizza Margherita', 7.50, 'Pomodoro, mozzarella e basilico', false);

UPDATE Menu
SET Prezzo = 9.00
WHERE Nome = 'Pizza Margherita';

--Op4
INSERT INTO Prenotazioni (ID_prenotazioni, Nome_cliente, Telefono_cliente, Data_prenotazione, Ora_prenotazione, Numero_persone, Codice_fiscale, Numero_tavolo)
VALUES (1, 'Mario Rossi', '1234567890', '2023-03-01', '20:00:00', 4, 'ABCDEF12G34H567I', 5);

--Op5
SELECT Menu.Nome, SUM(Dettaglio_Ordine.Quantita) AS Quantita_venduta
FROM Menu 
JOIN Dettaglio_Ordine ON Menu.ID_menu = Dettaglio_Ordine.ID_menu
JOIN Ordine ON Dettaglio_Ordine.Numero_ordine = Ordine.Numero_ordine AND Dettaglio_Ordine.Data = Ordine.Data AND Dettaglio_Ordine.Ora = Ordine.Ora
WHERE Ordine.Data = '2023-02-22'
GROUP BY Menu.Nome;

--Op6
SELECT Numero_ordini
FROM Dipendenti
WHERE ID_dipendente = 1;

--Op7
UPDATE Prenotazioni
SET NumeroPersone = 4
WHERE ID = 1;

--Op8
SELECT Prezzo
FROM Menu
WHERE ID_menu = 1;

--Op9
SELECT C.Nome, C.Cognome, O.Data, O.Ora, DO.Totale, M.Nome AS Nome_piatto, M.Prezzo AS Prezzo_piatto, DO.Quantita
FROM Cliente C
INNER JOIN Ordinazione O ON C.Codice_fiscale = O.Codice_fiscale
INNER JOIN Dettaglio_Ordine DO ON O.Numero_ordine = DO.Numero_ordine AND O.Data = DO.Data AND O.Ora = DO.Ora
INNER JOIN Menu M ON DO.ID_menu = M.ID_menu
WHERE C.Codice_fiscale = 'FGRHJP13B65I497D';

--Op10
UPDATE Inventario
SET Disponibilita = Disponibilita + 10
WHERE Codice = 100;



