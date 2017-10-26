------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: Recette
------------------------------------------------------------
DROP TABLE Ingredient_Recette;
DROP TABLE Recette_Etape;
DROP TABLE recette_effectue;
DROP TABLE Recette_prevu;
DROP TABLE Ingredient_Client;
DROP TABLE Ingredient_a_acheter;
DROP TABLE Interdit;
DROP TABLE Ingredient;
DROP TABLE Recette;
DROP TABLE Etape;
DROP TABLE Client;
DROP TABLE Regime;

CREATE TABLE Recette(
	idRecette          INT NOT NULL ,
	nomRecette         VARCHAR (40)  ,
	descriptif         VARCHAR (150)  ,
	auteur             VARCHAR (40)  ,
	difficulte         VARCHAR (25)  ,
	prix               INT   ,
	nbPersPourQuantite INT   ,
	CONSTRAINT prk_constraint_Recette PRIMARY KEY (idRecette)
);


------------------------------------------------------------
-- Table: Ingredient
------------------------------------------------------------
CREATE TABLE Ingredient(
	idIngredient  INT NOT NULL ,
	nomIngredient VARCHAR (25)  ,
	type          VARCHAR (25)  ,
	unite         CHAR (1)   ,
	equivalence   INT  NOT NULL ,
	calories      INT   ,
	lipides       INT   ,
	protides      INT   ,
	glucides      INT   ,
	CONSTRAINT prk_constraint_Ingredient PRIMARY KEY (idIngredient)
);


------------------------------------------------------------
-- Table: Regime
------------------------------------------------------------
CREATE TABLE Regime(
	idRegime  INT NOT NULL ,
	nomRegime VARCHAR (25)  ,
	CONSTRAINT prk_constraint_Regime PRIMARY KEY (idRegime)
);


------------------------------------------------------------
-- Table: Client
------------------------------------------------------------
CREATE TABLE Client(
	login    VARCHAR (25) NOT NULL ,
	email    VARCHAR (50) NOT NULL ,
	pswd     VARCHAR (40) NOT NULL ,
	idClient INT NOT NULL ,
	CONSTRAINT prk_constraint_Client PRIMARY KEY (idClient)
);


------------------------------------------------------------
-- Table: Etape
------------------------------------------------------------
CREATE TABLE Etape(
	tempsEtapeEnMin INT   ,
	nomEtape        VARCHAR (50)  ,
	idEtape         INT NOT NULL ,
	CONSTRAINT prk_constraint_Etape PRIMARY KEY (idEtape)
);


------------------------------------------------------------
-- Table: Ingredient_Recette
------------------------------------------------------------
CREATE TABLE Ingredient_Recette(
	quantite     INT  NOT NULL ,
	idRecette    INT  NOT NULL ,
	idIngredient INT  NOT NULL ,
	CONSTRAINT prk_constraint_Ingre_Rec PRIMARY KEY (idRecette,idIngredient)
);


------------------------------------------------------------
-- Table: Ingredient_Client
------------------------------------------------------------
CREATE TABLE Ingredient_Client(
	quantite     INT   ,
	idIngredient INT  NOT NULL ,
	idClient     INT  NOT NULL ,
	CONSTRAINT prk_constraint_Ingre_Cli PRIMARY KEY (idIngredient,idClient)
);


------------------------------------------------------------
-- Table: interdit
------------------------------------------------------------
CREATE TABLE interdit(
	idIngredient INT  NOT NULL ,
	idRegime     INT  NOT NULL ,
	CONSTRAINT prk_constraint_interdit PRIMARY KEY (idIngredient,idRegime)
);


------------------------------------------------------------
-- Table: Recette_prevu
------------------------------------------------------------
CREATE TABLE Recette_prevu(
	dateRecette DATE  NOT NULL ,
	nbPers      INT   ,
	idRecette   INT  NOT NULL ,
	idClient    INT  NOT NULL ,
	CONSTRAINT prk_constraint_Recette_prevu PRIMARY KEY (idRecette,idClient)
);


------------------------------------------------------------
-- Table: Ingredient_a_acheter
------------------------------------------------------------
CREATE TABLE Ingredient_a_acheter(
	quantite     INT   ,
	idIngredient INT  NOT NULL ,
	idClient     INT  NOT NULL ,
	CONSTRAINT prk_constraint_Ingre_a_acheter PRIMARY KEY (idIngredient,idClient)
);


------------------------------------------------------------
-- Table: Recette_Etape
------------------------------------------------------------
CREATE TABLE Recette_Etape(
	idRecette INT  NOT NULL ,
	idEtape   INT  NOT NULL ,
	CONSTRAINT prk_constraint_Recette_Etape PRIMARY KEY (idRecette,idEtape)
);


------------------------------------------------------------
-- Table: recette_effectue
------------------------------------------------------------
CREATE TABLE recette_effectue(
	date_Recette DATE  NOT NULL ,
	nbPers       INT  NOT NULL ,
	idRecette    INT  NOT NULL ,
	idClient     INT  NOT NULL ,
	CONSTRAINT prk_constraint_rec_effect PRIMARY KEY (idRecette,idClient)
);



ALTER TABLE Ingredient_Recette ADD CONSTRAINT FK_Ingre_Recette_idRecette FOREIGN KEY (idRecette) REFERENCES Recette(idRecette);
ALTER TABLE Ingredient_Recette ADD CONSTRAINT FK_Ingre_Recette_idIngre FOREIGN KEY (idIngredient) REFERENCES Ingredient(idIngredient);
ALTER TABLE Ingredient_Client ADD CONSTRAINT FK_Ingre_Client_idIngre FOREIGN KEY (idIngredient) REFERENCES Ingredient(idIngredient);
ALTER TABLE Ingredient_Client ADD CONSTRAINT FK_Ingre_Client_idClient FOREIGN KEY (idClient) REFERENCES Client(idClient);
ALTER TABLE interdit ADD CONSTRAINT FK_interdit_idIngredient FOREIGN KEY (idIngredient) REFERENCES Ingredient(idIngredient);
ALTER TABLE interdit ADD CONSTRAINT FK_interdit_idRegime FOREIGN KEY (idRegime) REFERENCES Regime(idRegime);
ALTER TABLE Recette_prevu ADD CONSTRAINT FK_Recette_prevu_idRecette FOREIGN KEY (idRecette) REFERENCES Recette(idRecette);
ALTER TABLE Recette_prevu ADD CONSTRAINT FK_Recette_prevu_idClient FOREIGN KEY (idClient) REFERENCES Client(idClient);
ALTER TABLE Ingredient_a_acheter ADD CONSTRAINT FK_Ingre_a_acheter_idIngre FOREIGN KEY (idIngredient) REFERENCES Ingredient(idIngredient);
ALTER TABLE Ingredient_a_acheter ADD CONSTRAINT FK_Ingre_a_acheter_idClient FOREIGN KEY (idClient) REFERENCES Client(idClient);
ALTER TABLE Recette_Etape ADD CONSTRAINT FK_Recette_Etape_idRecette FOREIGN KEY (idRecette) REFERENCES Recette(idRecette);
ALTER TABLE Recette_Etape ADD CONSTRAINT FK_Recette_Etape_idEtape FOREIGN KEY (idEtape) REFERENCES Etape(idEtape);
ALTER TABLE recette_effectue ADD CONSTRAINT FK_recette_effectue_idRecette FOREIGN KEY (idRecette) REFERENCES Recette(idRecette);
ALTER TABLE recette_effectue ADD CONSTRAINT FK_recette_effectue_idClient FOREIGN KEY (idClient) REFERENCES Client(idClient);


INSERT INTO Ingredient VALUES ('farine',)



















