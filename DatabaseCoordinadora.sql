CREATE TABLE `Country`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL
);
ALTER TABLE
    `Country` ADD PRIMARY KEY `country_id_primary`(`id`);
CREATE TABLE `Vehicle`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL,
    `IdRouteFk` INT NOT NULL,
    `IdTypeVehicleFk` INT NOT NULL
);
ALTER TABLE
    `Vehicle` ADD PRIMARY KEY `vehicle_id_primary`(`id`);
CREATE TABLE `Client`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL,
    `IdAddressFk` INT NOT NULL,
    `PhoneNumber` TEXT NOT NULL
);
ALTER TABLE
    `Client` ADD PRIMARY KEY `client_id_primary`(`id`);
CREATE TABLE `Product`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL,
    `IdGamaProductFk` INT NOT NULL,
    `IdPackageFk` INT NOT NULL
);
ALTER TABLE
    `Product` ADD PRIMARY KEY `product_id_primary`(`id`);
CREATE TABLE `Region`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` BIGINT NOT NULL,
    `IdCountryFk` BIGINT NOT NULL
);
ALTER TABLE
    `Region` ADD PRIMARY KEY `region_id_primary`(`id`);
CREATE TABLE `Order`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Quantity` INT NOT NULL,
    `Price` DOUBLE NOT NULL,
    `IdClientFk` BIGINT NOT NULL,
    `DateOrder` DATETIME NOT NULL,
    `DeliverDate` DATETIME NOT NULL,
    `ExpectedDate` DATETIME NOT NULL,
    `IdDeliverPointFk` INT NOT NULL
);
ALTER TABLE
    `Order` ADD PRIMARY KEY `order_id_primary`(`id`);
CREATE TABLE `PackageType`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Description` TEXT NOT NULL,
    `Name` TEXT NOT NULL
);
ALTER TABLE
    `PackageType` ADD PRIMARY KEY `packagetype_id_primary`(`id`);
CREATE TABLE `GamaProduct`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL
);
ALTER TABLE
    `GamaProduct` ADD PRIMARY KEY `gamaproduct_id_primary`(`id`);
CREATE TABLE `City`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL,
    `IdRegionFk` INT NOT NULL
);
ALTER TABLE
    `City` ADD PRIMARY KEY `city_id_primary`(`id`);
CREATE TABLE `TypeVehicle`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` TEXT NOT NULL
);
ALTER TABLE
    `TypeVehicle` ADD PRIMARY KEY `typevehicle_id_primary`(`id`);
CREATE TABLE `Route`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `DepartureDate` DATETIME NOT NULL,
    `ArrivalDate` DATETIME NOT NULL,
    `IdOrderFk` INT NOT NULL,
    `IdVehicleFk` INT NOT NULL
);
ALTER TABLE
    `Route` ADD PRIMARY KEY `route_id_primary`(`id`);
CREATE TABLE `Address`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Description` TEXT NOT NULL,
    `Complement` TEXT NOT NULL,
    `PostalCode` TEXT NOT NULL,
    `IdCityFk` INT NOT NULL,
    `IdPackageFk` INT NOT NULL
);
ALTER TABLE
    `Address` ADD PRIMARY KEY `address_id_primary`(`id`);
CREATE TABLE `Package`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `IdPackageType` INT NOT NULL,
    `Name` TEXT NOT NULL,
    `Description` TEXT NOT NULL,
    `IdOrderFk` INT NOT NULL
);
ALTER TABLE
    `Package` ADD PRIMARY KEY `package_id_primary`(`id`);
ALTER TABLE
    `Region` ADD CONSTRAINT `region_name_foreign` FOREIGN KEY(`Name`) REFERENCES `City`(`Name`);
ALTER TABLE
    `PackageType` ADD CONSTRAINT `packagetype_description_foreign` FOREIGN KEY(`Description`) REFERENCES `Package`(`id`);
ALTER TABLE
    `Order` ADD CONSTRAINT `order_id_foreign` FOREIGN KEY(`id`) REFERENCES `Client`(`id`);
ALTER TABLE
    `Country` ADD CONSTRAINT `country_name_foreign` FOREIGN KEY(`Name`) REFERENCES `Region`(`Name`);
ALTER TABLE
    `Package` ADD CONSTRAINT `package_idorderfk_foreign` FOREIGN KEY(`IdOrderFk`) REFERENCES `Address`(`PostalCode`);
ALTER TABLE
    `Order` ADD CONSTRAINT `order_dateorder_foreign` FOREIGN KEY(`DateOrder`) REFERENCES `Address`(`id`);
ALTER TABLE
    `Order` ADD CONSTRAINT `order_idclientfk_foreign` FOREIGN KEY(`IdClientFk`) REFERENCES `Route`(`id`);
ALTER TABLE
    `Vehicle` ADD CONSTRAINT `vehicle_id_foreign` FOREIGN KEY(`id`) REFERENCES `Route`(`id`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_name_foreign` FOREIGN KEY(`Name`) REFERENCES `GamaProduct`(`id`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_id_foreign` FOREIGN KEY(`id`) REFERENCES `Package`(`id`);
ALTER TABLE
    `Address` ADD CONSTRAINT `address_description_foreign` FOREIGN KEY(`Description`) REFERENCES `City`(`id`);
ALTER TABLE
    `Client` ADD CONSTRAINT `client_id_foreign` FOREIGN KEY(`id`) REFERENCES `Address`(`id`);
ALTER TABLE
    `Vehicle` ADD CONSTRAINT `vehicle_id_foreign` FOREIGN KEY(`id`) REFERENCES `TypeVehicle`(`id`);
ALTER TABLE
    `Package` ADD CONSTRAINT `package_description_foreign` FOREIGN KEY(`Description`) REFERENCES `Order`(`id`);