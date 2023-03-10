CREATE TABLE `Participants`(
    `id` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `roomID` CHAR(36) NOT NULL
);
ALTER TABLE
    `Participants` ADD PRIMARY KEY `participants_id_primary`(`id`);
CREATE TABLE `Room`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` TINYINT(1) NOT NULL
);
ALTER TABLE
    `Room` ADD PRIMARY KEY `room_id_primary`(`id`);
CREATE TABLE `Guilds`(
    `guildID` VARCHAR(255) NOT NULL,
    `guildOwnerID` VARCHAR(255) NOT NULL,
    `createdAt` DATE NOT NULL,
    `guildName` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Guilds` ADD PRIMARY KEY `guilds_guildid_primary`(`guildID`);
CREATE TABLE `User`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_id_primary`(`id`);
CREATE TABLE `GuildConfigurable`(
    `cmdPrefix` VARCHAR(255) NOT NULL,
    `guildID` VARCHAR(255) NOT NULL,
    `modLogID` VARCHAR(255) NOT NULL,
    `xpLogID` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `GuildConfigurable` ADD INDEX `guildconfigurable_guildid_index`(`guildID`);
ALTER TABLE
    `GuildConfigurable` ADD PRIMARY KEY `guildconfigurable_cmdprefix_primary`(`cmdPrefix`);
CREATE TABLE `Message`(
    `id` CHAR(36) NOT NULL,
    `roomID` CHAR(36) NOT NULL,
    `userID` CHAR(36) NOT NULL,
    `message` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Message` ADD PRIMARY KEY `message_id_primary`(`id`);
ALTER TABLE
    `Participants` ADD CONSTRAINT `participants_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `User`(`id`);
ALTER TABLE
    `GuildConfigurable` ADD CONSTRAINT `guildconfigurable_guildid_foreign` FOREIGN KEY(`guildID`) REFERENCES `Guilds`(`guildID`);
ALTER TABLE
    `Participants` ADD CONSTRAINT `participants_roomid_foreign` FOREIGN KEY(`roomID`) REFERENCES `Room`(`id`);
ALTER TABLE
    `Message` ADD CONSTRAINT `message_roomid_foreign` FOREIGN KEY(`roomID`) REFERENCES `Room`(`id`);
ALTER TABLE
    `Message` ADD CONSTRAINT `message_userid_foreign` FOREIGN KEY(`userID`) REFERENCES `User`(`id`);