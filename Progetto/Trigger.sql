delimiter //
CREATE TRIGGER sconto_ordine 
BEFORE INSERT ON Ordine 
FOR EACH ROW 
BEGIN 
    IF NEW.Totale > 100 THEN 
        SET NEW.Totale = NEW.Totale * 0.8; 
    END IF; 
END;

delimiter //
CREATE TRIGGER aggiorna_inventario AFTER INSERT ON Dettaglio_Ordine
FOR EACH ROW
BEGIN
    UPDATE Inventario
    SET Disponibilita = Disponibilita - (SELECT Quantita FROM Porzioni WHERE ID_menu = NEW.ID_menu AND ID_ingrediente = Inventario.ID_ingrediente) * NEW.Quantita
    WHERE Inventario.ID_ingrediente IN (SELECT ID_ingrediente FROM Porzioni WHERE ID_menu = NEW.ID_menu);
END;
