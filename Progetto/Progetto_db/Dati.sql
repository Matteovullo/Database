INSERT INTO Dipendente
  (ID_Dipendente, Numero_Telefono, Nome, Cognome, Stipendio, Selettore, Ruolo)
VALUES
  (1, '1234567890', 'Mario', 'Rossi', 2000.00, 1, 'Chef'),
  (2, '2345678901', 'Luca', 'Bianchi', 1500.00, 1, 'Aiuto chef'),
  (3, '3456789012', 'Paolo', 'Verdi', 1200.00, 0, 'Cameriere'),
  (4, '4567890123', 'Giovanni', 'Neri', 1200.00, 0, 'Cameriere'),
  (5, '5678901234', 'Roberto', 'Russo', 1000.00, 0, 'Cassiere');

INSERT INTO Tavolo
  (Numero_tavolo, Tipo_tavolo, Numero_persone)
VALUES
  (1, 'Interno', 4),
  (2, 'Interno', 4),
  (3, 'Esterno', 4),
  (4, 'Esterno', 4),
  (5, 'Esterno', 6);

INSERT INTO Cliente
  (Codice_fiscale, Nome, Cognome, Numero_telefono, Email, Numero_tavolo)
VALUES
  ('FGRHJP13B65I497D', 'Marco', 'Rossi', '3331234567', 'marco.rossi@example.com', 3),
  ('MTTLDN75C23D317L', 'Giulia', 'Bianchi', '3456789012', 'giulia.bianchi@gmail.com', 5),
  ('SNDLFE69C45F839E', 'Luca', 'Verdi', '3396547891', 'luca.verdi@example.com', 1),
  ('MTRLDP75C23D317L', 'Carlo', 'Neri', '3478459123', 'carlo.neri@gmail.com', 2),
  ('PNDRSN58645G447N', 'Alessia', 'Rizzo', '3341567892', 'alessia.rizzo@example.com', 3);

INSERT INTO Fornitore
  (ID_fornitore, nome, cognome, indirizzo, Numero_telefono, email)
VALUES
  (1, 'Giovanni', 'Rossi', 'Via Roma 1', '555-123456', 'giovanni.rossi@gmail.com'),
  (2, 'Luca', 'Verdi', 'Via Torino 2', '555-234567', 'luca.verdi@example.com'),
  (3, 'Anna', 'Bianchi', 'Via Napoli 3', '555-345678', 'anna.bianchi@gmail.com'),
  (4, 'Giovanni', 'Neri', 'Via Firenze 4', '555-456789', 'giovanni.neri@gmail.com'),
  (5, 'Paola', 'Rossi', 'Via Venezia 5', '555-567890', 'paola.gialli@example.com');

INSERT INTO Menu
  (ID_menu, Nome, Prezzo, Descrizione, Selettore)
VALUES
  (1, 'Pizza Margherita', 7.50, 'Pomodoro, mozzarella e basilico', false),
  (2, 'Pizza Marinara', 6.50, 'Pomodoro, aglio, origano e olio d oliva', false),
  (3, 'Pizza Prosciutto e Funghi', 9.50, 'Pomodoro, mozzarella, prosciutto cotto e funghi', false),
  (4, 'Penne all Arrabbiata', 8.00, 'Penne con salsa di pomodoro piccante', true),
  (5, 'Spaghetti Carbonara', 9.00, 'Spaghetti con uovo, pancetta e parmigiano', true);

INSERT INTO Ingrediente
  (ID_ingrediente, Nome, Prezzo)
VALUES
  (1, 'Pomodoro', 1.50),
  (2, 'Mozzarella', 2.20),
  (3, 'Farina', 3.10),
  (4, 'Lievito', 1.80),
  (5, 'Cipolla', 2.50),
  (6, 'Peperoni', 2.80);

INSERT INTO Inventario
  (Codice, Descrizione, Disponibilita, ID_fornitore, ID_ingrediente)
VALUES
  (100, 'Pomodoro', 50, 1, 1),
  (101, 'Mozzarella', 30, 1, 2),
  (102, 'Farina', 100, 2, 3),
  (103, 'Lievito', 50, 2, 4),
  (104, 'Cipolla', 20, 3, 5),
  (105, 'Peperoni', 30, 3, 6);

INSERT INTO Ordine
  (Numero_ordine, Data, Ora, Piatti_ordinati, Quantita, Totale, Numero_tavolo)
VALUES
  (1, '2023-02-21', '12:00:00', 'Pizza Prosciutto e funghi', 2, 18.00, 1),
  (2, '2023-02-21', '13:00:00', 'Pizza Margherita', 1, 7.50, 2),
  (3, '2023-02-21', '14:00:00', 'Pizza Margerita, Pizza marinara', 2, 14.00, 3),
  (4, '2023-02-21', '15:00:00', 'Pizza marinara', 1, 6.50, 4),
  (5, '2023-02-22', '12:00:00', 'Spaghetti alla carbonara', 2, 18.00, 5);

INSERT INTO Lavorazione
  (Numero_ordine, ID_Dipendente, Data, Ora)
VALUES
  (1, 1, '2023-02-21', '12:00:00'),
  (2, 2, '2023-02-21', '13:00:00'),
  (3, 3, '2023-02-21', '14:00:00'),
  (4, 4, '2023-02-21', '15:00:00'),
  (5, 5, '2023-02-22', '12:00:00');

INSERT INTO Porzioni
  (ID_ingrediente, ID_menu, Quantita)
VALUES
  (1, 1, 2),
  (2, 1, 2),
  (3, 1, 5),
  (1, 2, 2),
  (2, 2, 2);

INSERT INTO Ordinazione
  (Codice_fiscale, Numero_ordine, Data, Ora)
VALUES
  ('FGRHJP13B65I497D', 1, '2023-02-21', '12:00:00'),
  ('MTTLDN75C23D317L', 2, '2023-02-21', '13:00:00'),
  ('SNDLFE69C45F839E', 3, '2023-02-21', '14:00:00');

INSERT INTO dettaglio_ordine
  (Numero_ordine, Data, Ora, ID_menu, Quantita, Totale)
VALUES
  (1, '2023-02-21', '12:00:00', 3, 2, 18.00),
  (3, '2023-02-21', '14:00:00', 1, 1, 7.50),
  (3, '2023-02-21', '14:00:00', 2, 1, 6.50);

INSERT INTO prenotazioni
  (ID_prenotazioni, Nome_cliente, Telefono_cliente, Data_prenotazione, Ora_prenotazione, Numero_persone, Codice_fiscale, Numero_tavolo)
VALUES
  (1, 'Marco Rossi', '3331234567', '2023-02-21', '12:00:00', 4, 'FGRHJP13B65I497D', 3);
