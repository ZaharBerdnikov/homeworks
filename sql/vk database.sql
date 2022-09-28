#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: likes
#

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: photo_albums
#

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: photos
#

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('101', 'Priscilla', 'Muller', 'jeramie.halvorson@example.org', '1749905b771e25b22609d963b26d6376042655cb', '874');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('102', 'Reymundo', 'Kuhic', 'tito.denesik@example.org', '9248e0c95674fe41cffa0093cde1a9e7bf34fa9a', '61328');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('103', 'Thea', 'Brekke', 'florida88@example.org', 'ef59db53fe1190647fb343d245d58666a9cdd41d', '0');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('104', 'Sylvan', 'Labadie', 'kailyn56@example.com', '6c0e99f43fcbf6600a9847620aa00c77b960ee45', '75');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('105', 'Jaron', 'Conroy', 'nicholas.schimmel@example.org', '7145653af961eb5cb4e15e981016c2b9aa191a3d', '730');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('107', 'Gina', 'Koepp', 'romaine21@example.net', '599e6d0561d0f8a81da338d27902db5c28d21dd7', '892');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('108', 'Willa', 'Medhurst', 'keely.adams@example.org', '704d6089eaa677a24a269cf39ef8b305c5881277', '165');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('109', 'Demario', 'Kerluke', 'baumbach.keon@example.org', 'f09db17a6facbb27fe0551db90d4d6cb226a7a2e', '175');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('110', 'Jeanne', 'Daniel', 'erling04@example.org', 'ff01c8c1da571ccf33e717e066389b4e75c2da50', '388');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('111', 'Esperanza', 'Nicolas', 'javonte54@example.net', '61a8033734d6b875b780ae4795ad5ec540396167', '140467');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('112', 'Bartholome', 'Blanda', 'evans47@example.com', 'e0e68070cb9eab099e61227c868de02959a81624', '419');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('113', 'Brady', 'Ryan', 'grau@example.org', '1ebe03bc51d540ccae208dec1bfc67b616abdd32', '1');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('114', 'Blaise', 'Schiller', 'ofelia01@example.org', '352f94f1b17955306a53b1e0eca4d11d123486fd', '398');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('116', 'Madaline', 'Gutmann', 'wilber.raynor@example.com', '02fb3cf45a73be399ea63b78085f0e20d0376475', '52');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('117', 'Alexys', 'Von', 'jon.stehr@example.net', '13d502906182439821a170c76cdf14e14c4867c3', '980');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('119', 'Chanelle', 'Hoppe', 'rosalinda86@example.com', '3726909a782837caf6e1b5a4fa67b60634688789', '214805');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('120', 'Sonia', 'Hickle', 'roberto44@example.org', '2365136d4f38e1654854684a46dc33939541161c', '3');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('121', 'Kianna', 'Gibson', 'aberge@example.org', '2268fdf7cf135777987308cf2c6dd0cf710c91b5', '2033161192');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('123', 'Sallie', 'Klein', 'ternser@example.org', 'aef86d8728ba7066f5ab59cab1b6813ba157fa61', '7619372538');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('124', 'Matilda', 'Metz', 'river.senger@example.net', 'e95427b0252b51c01f3a8ddb610837338f281af1', '555');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('125', 'Dangelo', 'Pouros', 'jerome.o\'conner@example.net', '2214b1bb42cce575482deb3424c0b53242bd7e99', '918');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('126', 'Liam', 'Predovic', 'tyree27@example.org', '7bac7386e27a39fd64b3c15311f10e5547e720cd', '585');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('127', 'Adelbert', 'Kuhic', 'josh95@example.net', 'ef4f8600507d1b9458d97e31918c1e7e373e01a0', '798');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('128', 'Aimee', 'Dibbert', 'kondricka@example.net', '03270a221d3caa06864feaf97569036eab284c63', '576');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('130', 'Diana', 'Adams', 'amelie24@example.net', 'b8cea58770e220573f00206da8d70850c0be838a', '96466');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('133', 'Paxton', 'Jones', 'wolff.hyman@example.com', '092e62d9e1be836f0ebf0c08ec34f4a7a43142b5', '87');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('136', 'Charlotte', 'Hodkiewicz', 'carmel.pollich@example.org', '92d0f88a7facd324d593269d85e4931cd2a94b00', '195221');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('137', 'Kevon', 'Rempel', 'treva.kessler@example.com', 'ca1006396fe09d472469c50f75cc3925c1fd5f7e', '949412');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('140', 'Tommie', 'Purdy', 'vkessler@example.com', 'b96eac28ea7119d0abfd0ac361a0333e42b5e5e3', '7434793865');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('141', 'Shaina', 'Feest', 'maximillia49@example.net', '35a8793a2e82ed3cdc007e3ef29eedba531a1232', '502757');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('145', 'Precious', 'Champlin', 'dkoelpin@example.com', '1a10118ef6708e2d03992af715e635e9976d9d7e', '343');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('147', 'Keegan', 'Smith', 'heaney.rylee@example.net', '9fe835ada6e65bda60e1215d87ff16fb60f3adf7', '967671');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('148', 'Harmony', 'Bednar', 'goldner.walton@example.org', '98ddf83bde9741677390e93876e65e52ac88815f', '47337');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('149', 'Elyse', 'Mertz', 'marley.crooks@example.com', '880f61b4ac2041acbe7ca9a54e9125bf61f80923', '949483');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('150', 'Ronny', 'Ankunding', 'meagan.haley@example.org', 'c36dc47c7881d840ac4ebf6e9a85e5c70e753feb', '362369');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('152', 'Fern', 'Hilpert', 'myrna.howell@example.org', 'dbdfbd4aef015e0c4b4f18d806b77dfb8b6ab448', '3289');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('153', 'Darwin', 'Smith', 'furman.koepp@example.org', 'bfecb27d05b52a98078066e72d4d9f6ea0ca1c8b', '99558');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('157', 'Felicity', 'Mitchell', 'welch.loma@example.net', '0f02c67f219480a29aaa1c8e7d564bb1bf07a31a', '39');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('158', 'Oswaldo', 'Rohan', 'aconroy@example.org', 'b203f13ba52a40ec06fefb7f39e39c24d1c88b54', '449');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('159', 'Brycen', 'Hayes', 'umedhurst@example.com', '4952235fc3647d412f49e3ee3c76e331747c6050', '142');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('160', 'Marilyne', 'Nicolas', 'qspencer@example.com', 'fd4db05657735ca343e0f600bef856734747d20a', '8233922997');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('161', 'Laurianne', 'Krajcik', 'ewisozk@example.org', '41df2342425b76347da787fa261e0b12eab6d0cf', '818');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('163', 'Ella', 'Cronin', 'owen62@example.com', '58d8a987ddffe949432327a5556e5fe9f5671c10', '2918809030');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('164', 'Maybelle', 'Adams', 'lionel.hand@example.com', '516c17a530cfd0c0d4fa04ecea445382a414114f', '1961183836');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('165', 'Jayce', 'Willms', 'wilkinson.pattie@example.com', '2c5debb75b08f8b66b404dd44549b5d88b9e916a', '26');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('166', 'Abel', 'Kreiger', 'christina42@example.net', '9b7d09a93ff32408015aefaa302deaba80110ffb', '814');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('167', 'Lauren', 'Moen', 'rschmidt@example.org', '7d719c1b68f4197be058bd316004d59bbe8f8dfa', '721');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('168', 'Flavie', 'Hammes', 'wmcglynn@example.com', '0dc7a744b43b92a292ea3955cbb9ea0217e7577a', '640167');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('169', 'Naomie', 'Feeney', 'cpfannerstill@example.org', '43ae45407fb9287417b197e875d8220df8ab8ab2', '6980004370');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('170', 'Florencio', 'Price', 'maryam.schultz@example.com', '761daec7f7c702082be7402a2180c0e60c70a3f2', '830');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('171', 'Sierra', 'Lynch', 'sheridan.erdman@example.com', '8a1f08651b757ed0f2075b8bdf4878681885402b', '850550');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('172', 'Natasha', 'O\'Reilly', 'althea23@example.com', '7856c72020d4244080f94c0cc4670e2919d07901', '516543');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('174', 'Eldred', 'Hagenes', 'ghickle@example.net', '19389fcaa1d54c5a1965e54b06b0749cf263d367', '958');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('175', 'Kristin', 'Wilderman', 'zella.orn@example.com', '4ca37fe7a2e6cb8534d1c8c94e66aab7990e8157', '589781');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('177', 'Christina', 'Conn', 'mack28@example.com', 'ca0cc964e4a9416ce5d3e59cd24d9e41507e354c', '810');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('180', 'Lucie', 'McLaughlin', 'ledner.jerad@example.com', 'fb674d13aa0196b38458332a2e81c838c73a8db9', '5048047516');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('183', 'Elisabeth', 'Fahey', 'cordie53@example.org', '328bbb4d4efe99b331cdc5946837d49c6dabb67e', '842');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('188', 'Felipa', 'Oberbrunner', 'camryn13@example.org', 'b0363dd8ccf5231092f941b6868b110477f31974', '476359');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('189', 'Patsy', 'Boyle', 'sanford.ruthe@example.net', 'b2e723086c4bc06de1a9a094e839ad3a0b6bab12', '9855846191');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('192', 'Madie', 'Conn', 'hertha60@example.net', '4959260b2be21d382ca8b7f282f03e3a341fb798', '850');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('194', 'Monserrat', 'Okuneva', 'evalyn.schmitt@example.net', '0985ec846172ddf37bbc796ba13af5b862d98b98', '225');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('195', 'Lucienne', 'Schneider', 'simonis.addie@example.com', '47bfb912b73bc035f74ab91787a591791ebf6389', '5504297104');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('196', 'Sunny', 'Thompson', 'xtowne@example.net', 'bdc5281ad8376ece14e3e2ece24b4203b95c2b6b', '35');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('197', 'Estrella', 'Carter', 'harrison62@example.org', 'd9d92efbae587c75cedc47245e34cb55c5d50f65', '609');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES ('200', 'Moriah', 'Bogan', 'hermann.blick@example.com', '3b49095026dfbfbbdd0ee0906f4bf6da73665d4a', '656971');


#
# TABLE STRUCTURE FOR: users_communities
#

DROP TABLE IF EXISTS `users_communities`;

CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

