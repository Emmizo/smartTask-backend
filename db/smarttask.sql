-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: smarttask
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_02_21_163440_create_statuses_table',1),(5,'2025_02_21_163504_create_projects_table',1),(6,'2025_02_21_163505_create_tags_table',1),(7,'2025_02_21_163506_create_tasks_table',1),(8,'2025_02_21_163548_create_task_tag_table',1),(9,'2025_02_23_084220_create_oauth_auth_codes_table',2),(10,'2025_02_23_084221_create_oauth_access_tokens_table',2),(11,'2025_02_23_084222_create_oauth_refresh_tokens_table',2),(12,'2025_02_23_084223_create_oauth_clients_table',2),(13,'2025_02_23_084224_create_oauth_personal_access_clients_table',2),(14,'2025_02_23_085239_create_personal_access_tokens_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('01a45b1223e6efd336c3d2f40bb83e516fe1639a47aa981aea93021076e2d6522b018c3fbf4302ee',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:48:03','2025-02-24 09:48:03','2026-02-24 11:48:03'),('05aea94339c94016225d3d71df7354b2ba9d0652dc7ed53828469d342209597e5d1db564b168731d',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:01:26','2025-02-24 10:01:26','2026-02-24 12:01:26'),('071539613225dfe952a099119d7718c566d0b19b8bbbc24b1062f32207009e94ea2b0d0ef65d11be',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 12:13:51','2025-02-27 12:13:51','2026-02-27 14:13:51'),('08e17c9b5d42d3d19ae3b964d00aaf18b04a1ad80fd92ddba3180ed294e092aa6dea7d97b5832a33',1,1,'Laravel Password Grant Client','[]',0,'2025-02-25 14:36:57','2025-02-25 14:36:57','2026-02-25 16:36:57'),('0945c31d88ebe9ac71aba4cf85b788b53bb8e916044e26e63b4e962c52509ef71b66d21444e767ec',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:59:02','2025-02-23 16:59:02','2026-02-23 18:59:02'),('0b256637ba27075c56e5968bb4ec77cb6e5b174255e7b036d8f7b99e0226fdf974001dbe44fa7ea8',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:46:33','2025-02-23 16:46:33','2026-02-23 18:46:33'),('0c52e4a7d527582685be773ac4324a116ba483738c94e6fac2add6ebfd0fa52892027cf2fd3883e9',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:05:01','2025-02-23 17:05:01','2026-02-23 19:05:01'),('13abbbf9d079c7810c68b82a6bebbb287dc687e2f84271908c2e162d65a47b6d442e49fe4b50d67d',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 03:13:35','2025-02-27 03:13:35','2026-02-27 05:13:35'),('147ea294647aece3ccda87a0cbc705439eb52a5be4a49773bf9dc8b250cd607ccf133b1df5f477a3',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:53:55','2025-02-24 09:53:55','2026-02-24 11:53:55'),('171c78b6542d6419a99186f77b9b1687c33a60c322973b6e7b815653205d21491cfff59c68c8893c',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:12:53','2025-02-24 10:12:53','2026-02-24 12:12:53'),('1bb510566ef3da8a2196c5d483aa4619671ae9af6e6f576a770d97b84ad46fc6b1c38bc7aa475dd2',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:05:27','2025-02-23 17:05:27','2026-02-23 19:05:27'),('20f34f6513fa0f964eb9248a636c92213ea23a7703507fbe35333413dea47d3de662ea9ba6089b18',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:01:28','2025-02-24 10:01:28','2026-02-24 12:01:28'),('218ddf142dd020624b8bcd96f5eecb8ad57f976ef496e26143c918aea3a3c0628000795a373aa3a2',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:47:23','2025-02-23 16:47:23','2026-02-23 18:47:23'),('2318bfdac581c393d9ef6db5c96fcc4f54f38b0aecd649974b75697f7df7e20c14f466504a2d7e41',1,1,'Laravel Password Grant Client','[]',0,'2025-02-26 20:10:04','2025-02-26 20:10:04','2026-02-26 22:10:04'),('24aa9ed2ea094dda172c8448a2aa67bf5fd6a7e9fd9e06f8960ad956072c2e90c07015ee1804a50c',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:48:05','2025-02-24 09:48:05','2026-02-24 11:48:05'),('288b21bcada7f023ca372f1e5cb04ef3797d2c7099183e2135c3528be83a883bbeb6237e9168748d',6,1,'AuthToken','[]',0,'2025-02-24 13:38:25','2025-02-24 13:38:25','2026-02-24 15:38:25'),('31e80a615137a415a32b87b45ec7c9a28b0ad411c8d491414b7e555cffe62132d46d8f07a61c3c0e',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:08:06','2025-02-23 17:08:06','2026-02-23 19:08:06'),('31f13161a43abc5d1364e824bc289baddebed55c231a7b3f6edee38f877691b139f22d20444b5f14',1,1,'Laravel Password Grant Client','[]',0,'2025-02-26 18:58:23','2025-02-26 18:58:23','2026-02-26 20:58:23'),('330bf491ece7df57fc9dc308aa287b9f7d2f8c5b22a3370cb560f2f9904daf8570605221304b3d52',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:47:14','2025-02-24 09:47:14','2026-02-24 11:47:14'),('33cef9a707f5de34e31d69f9c5c64e883299e8e6d1a631ccb0069d75ea481ae340b66312ec4e371d',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:55:13','2025-02-24 09:55:13','2026-02-24 11:55:13'),('3c113d8e8e2783009d6ff46a707c5081b7404e1f0a04924a284e8705f8adbf272105174e1ffb709e',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:59:29','2025-02-23 16:59:29','2026-02-23 18:59:29'),('3eed8723b0af25b4b18aeaada952f54d63f284c5f5d0f7c5e828ca8ec8baf87b3f639fc9c9e781f7',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:54:39','2025-02-24 09:54:39','2026-02-24 11:54:39'),('485fe9255dd5638588410b371215c4c2a5ac3eba26744715005c7ffb8af04c37781f49f35e7e85d6',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:53:30','2025-02-24 09:53:30','2026-02-24 11:53:30'),('4c1c9180be4ff280801f664a59cde03ce253f7eaed5d865dd04dc2d79d7d45b7e44a11efe59afa49',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:56:30','2025-02-23 16:56:30','2026-02-23 18:56:30'),('4dd65f3d9b65cbece6e1dc4db6413e58ad996e067ff0d972fe3942ce5e0e39874753ff9cfe5d0551',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:56:18','2025-02-23 16:56:18','2026-02-23 18:56:18'),('4f4c0a57fa0ade3e4a1a140d9087d3f927264a6454140a1498dffdd80f67090eecdd9c67f226b535',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 07:51:59','2025-02-24 07:51:59','2026-02-24 09:51:59'),('56c0b05fdb7d7826e105f6240087876fa9fb11cd03f8b25a0dc7ed59d3aed9cebb2daf3422474240',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:38:22','2025-02-23 16:38:22','2026-02-23 18:38:22'),('5714e9a506cb2bdf27f2e6a265da9d596f84ee4c3f51f8bf6b3d49d91c8e4e266e937d7afa064c93',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 06:56:20','2025-02-23 06:56:20','2026-02-23 08:56:20'),('5cf167c4409356ca07aeedd721b6ed8f4defebc26140aa619ca903f8ba1402d4f59a53989835dffb',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:39:34','2025-02-23 16:39:34','2026-02-23 18:39:34'),('60f4fbca6fdf5ffb78a1b545830053234c5a437a921d13ddba7cf8823fbb9c95778d749abfe3153e',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 08:04:30','2025-02-23 08:04:30','2026-02-23 10:04:30'),('6572358e6b303c9471c79869ea5789a06244c1ceb2900f714f09d6e007dee6f239dd1305aab464a0',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:56:18','2025-02-23 16:56:18','2026-02-23 18:56:18'),('68a97d63fd1d40c18a96d00603c3f5daa6c1403a244a55ad9f4c5ec67a035c3e410fb5946db6f6ef',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 03:10:19','2025-02-27 03:10:19','2026-02-27 05:10:19'),('69ba49f01d82ea52d33adff2f06d19aa768b89179c06b39e1a4af6183069f774a2f37e03c83a977a',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 11:36:47','2025-02-24 11:36:47','2026-02-24 13:36:47'),('7068bacb868066e584d63ac422ec0a4c561eb4d9c6413559094e3e2c401586215169bf3a443480db',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:58:34','2025-02-23 16:58:34','2026-02-23 18:58:34'),('722eb5f8d6cd59707a1aa695206b78ae474dc3ab1c5924bb4024d5309e57d5d90bd27fbfb9b1b73a',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:59:50','2025-02-23 16:59:50','2026-02-23 18:59:50'),('7492d41cf0dc05310084b69d2795b5be932146dc5a206d8b86f5af67447ceca5d67219085b25ab34',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:04:34','2025-02-24 10:04:34','2026-02-24 12:04:34'),('767c5684a494747f09cbef8792260867375ea386fcb5d2191f601a1ae65a947958f639ecebc6adab',1,1,'Laravel Password Grant Client','[]',0,'2025-02-25 14:29:18','2025-02-25 14:29:18','2026-02-25 16:29:18'),('78eafec4e3a9cf1e215db88b49dfdee91e347ce6c210fc123881f8220644ee6863d980c97477c0bd',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:47:37','2025-02-24 09:47:37','2026-02-24 11:47:37'),('7a1035b1a6e50b1c7292b9e0dd2c1dc9a53f4a7ef9c2de7fb6876691aa0bcfa8940f860a21d8d245',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 16:21:20','2025-02-27 16:21:20','2026-02-27 18:21:20'),('7a5a4c59021b2334e8eb4f2b45bf8533b3b7c4e05f7d9db68c3b18f35b8292ecbef75685986143ce',4,1,'AuthToken','[]',0,'2025-02-23 18:11:06','2025-02-23 18:11:06','2026-02-23 20:11:06'),('7b80f5e0d21271707a2edbcfec0f7119c4762bc7df25da94559f6427519a74ddcb95dbbea44b6c58',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:04:58','2025-02-23 17:04:58','2026-02-23 19:04:58'),('7bf26da46cb1380138265b15e74c7bed33e286155506332838858f6eb989c464a8aba24fd8cea49a',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 12:16:47','2025-02-24 12:16:47','2026-02-24 14:16:47'),('7e3ebb115795fad63cd3eff92168b279033e0778349691088d790a24c89bf335b24570ec303a6c45',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:23:13','2025-02-24 09:23:13','2026-02-24 11:23:13'),('83df838f17c05a5b0c0e6c29dc36ffb6630c245733a541cdf4c427ed2806974a9183b2e7283628a4',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 11:27:09','2025-02-27 11:27:09','2026-02-27 13:27:09'),('88724b6099d62c15d1eda415b67a3fac2e9859e6ca0ab267efa4e8cedae1475220b76cdb3948c11e',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:12:55','2025-02-23 17:12:55','2026-02-23 19:12:55'),('90b1edc04e2b918ae0ccff05096cc4272e0be0aa8e1092991cd6d3cfbf88f5d2963d6e08c2b71cbe',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:51:59','2025-02-24 09:51:59','2026-02-24 11:51:59'),('92fa28445c58e27f08e33c31749d103d19755ba611b290c38bc499b47fef2173c3af7887e3993950',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:30:40','2025-02-24 09:30:40','2026-02-24 11:30:40'),('94f1a57fbecdfcee54341718da0b3676f3c1100e81dceaabee2b8babedda44f0e1d1aaece61750d4',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 08:25:15','2025-02-24 08:25:15','2026-02-24 10:25:15'),('9857fb1f1453549742b3531ae3a1aa30da125da0fa252c50982e486eeade625fdc1f10eb1736f68a',1,1,'AuthToken','[]',0,'2025-02-23 06:54:47','2025-02-23 06:54:47','2026-02-23 08:54:47'),('9dda0da15c06f65e3289019f4e10bcda724cfa05d17ec3ff54eb5614b8bba68a55c13b5d951ef52d',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:07:31','2025-02-24 09:07:31','2026-02-24 11:07:31'),('9f6295c44527a927d83f93de01a5a13d378d8900e90e6238b2a3dc72c4b8e7b4ca8b2b521fceb34e',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:37:14','2025-02-23 16:37:14','2026-02-23 18:37:14'),('a38e141c625cdc6ad210f94e003cdb475d288d0f38c6df63a5d68d4dfd9efade1d9040967224632d',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:05:44','2025-02-23 17:05:44','2026-02-23 19:05:44'),('a74960f1020591074334dde62303dc8cdc8cadbc4c004e59fc3d47d524a29bdebfbf21fba98baaa9',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:48:06','2025-02-24 09:48:06','2026-02-24 11:48:06'),('aab525edef8ad5359f3c81a2cbc3971b2ab8f2b084461eef6fb0be4cac4d000f3bfe69c5410431a3',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:47:19','2025-02-24 09:47:19','2026-02-24 11:47:19'),('ada52ba9fa03ecb11f337d59cfb65620e3c200e661b1a288517efd5d4087bec5e924f977ae339489',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:12:51','2025-02-24 10:12:51','2026-02-24 12:12:51'),('aefa7ec1fb39173e77bebe8ae322306c931d5bb1a1dbc051ec38de47198c3115427ecbdb892e1632',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 11:57:42','2025-02-24 11:57:42','2026-02-24 13:57:42'),('b2b0da02524b93a01d11f6306ce97e13e6d72d9463617c41df3fdb68fbf8124e2b13b7fd43879450',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:37:45','2025-02-23 16:37:45','2026-02-23 18:37:45'),('b73fd136f9b9713e4664575c59351c25f7a6acae3dad41fbdd49d5f7e1f0375bc5a76613c3b216ca',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:14:01','2025-02-24 10:14:01','2026-02-24 12:14:01'),('b9951bf40d1233d8710b8177528c93e3cf71bba948c0ff63458216ea92e7676d3304d126d46d0452',1,1,'Laravel Password Grant Client','[]',0,'2025-02-27 16:05:47','2025-02-27 16:05:47','2026-02-27 18:05:47'),('c20baa2d92d910eeea166b06f1672f9c866064050107e93e926e98dea8d61b5d759a8ee52634933a',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 08:34:16','2025-02-24 08:34:16','2026-02-24 10:34:16'),('cb9df090e975ed3c4f32138fd65285442b41b288c28c97189449edf31e16159f2d3398cb1ae24567',5,1,'AuthToken','[]',0,'2025-02-23 18:18:15','2025-02-23 18:18:15','2026-02-23 20:18:15'),('cffff07210e0491e37db406aab89df9bc5247ca20564d43ffb7a7640b7ac053b8b7b319ee41a4528',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 07:41:26','2025-02-24 07:41:26','2026-02-24 09:41:26'),('d08792d65adeac82e0d58b782e138091a503343587b29c252178dafa2e2a4f6df052590fd974cc3b',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 11:43:46','2025-02-24 11:43:46','2026-02-24 13:43:46'),('d5192713ac43ccdb2db18ddcdf4946156d992ca34d306831bfd61cda280881bc6d7a3bb3fabee5be',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:45:04','2025-02-23 16:45:04','2026-02-23 18:45:04'),('d755a257edb1460505c2d5ccebae552e6670d6af55bb092d09668222c61b5141fbf7b03c98091d7c',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 12:02:31','2025-02-24 12:02:31','2026-02-24 14:02:31'),('d7981be4d33cdf2185179f13b83a98f179fb7a6c82db937ae45d661a9daf75b7c6d675153771a1eb',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:03:40','2025-02-24 10:03:40','2026-02-24 12:03:40'),('da74a406cd4ec9683ed86da206667fe903ab80f8518bebaaeebf1606c376e77937bd117162cd5d16',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 10:25:38','2025-02-24 10:25:38','2026-02-24 12:25:38'),('de8ff3948b54fb4bdbfa661d9dd906102c092d8cea03bc666a15e4629dd2a826c0b5e30d21d2c725',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 17:06:50','2025-02-23 17:06:50','2026-02-23 19:06:50'),('deaa559d63e1a84299189f3f789003813f5a60dffe313bac2451cf6751dbfd1ceb301e073b7398cd',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:57:47','2025-02-23 16:57:47','2026-02-23 18:57:47'),('e10bfbe54044b12f37bf5eff8771530de96ad43e64379e9516b4774fa8ee4f14041816ebc190de99',3,1,'AuthToken','[]',0,'2025-02-23 17:55:29','2025-02-23 17:55:29','2026-02-23 19:55:29'),('e453f95a699d74c3dbd4c97311ca8fe7b6b49347c2fd31ff2c52ccfa5eaa7b707c9a8aec18526b69',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:10:24','2025-02-24 09:10:24','2026-02-24 11:10:24'),('e6e6d7196efd22477bd9cdc0d79ebb0c9a12317e1fbdab7bdb7b5b08f3b81aae3210b4de04cb8af2',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 08:34:24','2025-02-24 08:34:24','2026-02-24 10:34:24'),('e8b5b75406f81b4f815d1c55246b84ce8d57bfa30a4005d0969471d27493fbc44d3f8cc68631a5d5',2,1,'AuthToken','[]',0,'2025-02-23 07:52:06','2025-02-23 07:52:06','2026-02-23 09:52:06'),('f9dfe46e98b661fe05af30136bade1187151e1cdc0f2611d123a4556a6a5c8f5d1b9a637ab5138a6',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:55:52','2025-02-24 09:55:52','2026-02-24 11:55:52'),('fa1af940988aeafe2bb67c15e0e0583cc233de8538d3e8115886fc82421b9e9c98ca84ab86188389',1,1,'Laravel Password Grant Client','[]',0,'2025-02-23 16:54:54','2025-02-23 16:54:54','2026-02-23 18:54:54'),('fec684f3c9a407eeb5265991924f227b52b72a327ad5c6eb0b01c51eb9a4782d04e8b647e9180d4a',1,1,'Laravel Password Grant Client','[]',0,'2025-02-24 09:54:22','2025-02-24 09:54:22','2026-02-24 11:54:22');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','3kW2xoM7KuXhWsWCO7c395cl8Abz6RGfnYnXdFIP',NULL,'http://localhost',1,0,0,'2025-02-23 06:42:26','2025-02-23 06:42:26'),(2,NULL,'Laravel Password Grant Client','Pg7LOL0GudoKGyRMjtLeTfrnXBxTJsjvObC31Lht','users','http://localhost',0,1,0,'2025-02-23 06:42:26','2025-02-23 06:42:26');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2025-02-23 06:42:26','2025-02-23 06:42:26');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tags`
--

DROP TABLE IF EXISTS `project_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_id` json DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tags`
--

LOCK TABLES `project_tags` WRITE;
/*!40000 ALTER TABLE `project_tags` DISABLE KEYS */;
INSERT INTO `project_tags` VALUES (1,'[\"1,2,4,7\"]',6),(2,'[\"1,3,4,6\"]',7),(3,'[\"1,2,4,7\"]',10),(4,'[\"1,3,4\"]',9),(5,'[\"1,2,4,7\"]',11),(6,'[\"4\", \"7\"]',12),(7,'[\"5\", \"6\", \"2\"]',13),(8,'[\"5\"]',14),(9,'[\"5\"]',15),(10,'[\"5\", \"6\"]',16),(11,'[\"3\"]',17),(12,'[\"4\"]',18),(13,'[\"3\"]',19),(14,'[\"4\"]',20),(15,'[\"3\"]',21);
/*!40000 ALTER TABLE `project_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `owner_id` bigint unsigned NOT NULL,
  `progress` double DEFAULT '0',
  `deadline` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_owner_id_foreign` (`owner_id`),
  CONSTRAINT `projects_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (6,'GBOH','Good bye old home',1,0.9,'2025-04-23 09:56:05','2025-02-23 07:52:24','2025-02-23 07:52:24'),(7,'TechVerse','Play your way and experience of gaming at home',1,0,'2025-03-23 09:56:05','2025-02-23 07:56:05','2025-02-23 07:56:05'),(8,'Football Score line','This app aim to help football lover to know trending news',1,0,'2025-05-23 09:56:05','2025-02-25 10:36:01','2025-02-25 10:36:01'),(9,'Football Score line','This app aim to help football lover to know trending news',1,0,'2025-06-23 09:56:05','2025-02-25 10:39:17','2025-02-25 10:39:17'),(10,'Music my Things','This app aim to help music lover to know trending news',1,0,'2025-06-23 09:56:05','2025-02-25 10:41:39','2025-02-25 10:41:39'),(11,'Music my Things','This app aim to help music lover to know trending news',1,0,'2025-06-23 09:56:05','2025-02-25 11:04:06','2025-02-25 11:04:06'),(12,'JDV','Tourism app, aim to help people to know where they can find good creature',1,0,'2025-04-03 00:00:00','2025-02-25 21:56:36','2025-02-25 21:56:36'),(13,'Driver app','This app is for company that help them to truck their driver',1,0,'2025-06-06 00:00:00','2025-02-25 22:00:28','2025-02-25 22:00:28'),(14,'Online driving learn','This app will driver student to know how exam center work',1,0,'2025-09-11 00:00:00','2025-02-26 13:06:51','2025-02-26 13:06:51'),(15,'Unguka Web','This Unguka muhinzi for farmer and their client that will help them to sell or buy, just for handle communication between them',1,0,'2025-03-05 00:00:00','2025-02-26 13:21:41','2025-02-26 13:21:41'),(16,'MIS','New MIS for managing school',1,0,'2025-02-27 00:00:00','2025-02-26 13:31:04','2025-02-26 13:31:04'),(17,'The future','It web at all',1,0,'2025-02-28 00:00:00','2025-02-26 19:01:17','2025-02-26 19:01:17'),(18,'New PRO','new pro is web based and app which aim to analyze true info',1,0,'2025-07-31 00:00:00','2025-02-27 03:25:56','2025-02-27 03:25:56'),(19,'TesApp','New Designer',1,0,'2025-02-28 00:00:00','2025-02-27 03:38:30','2025-02-27 03:38:30'),(20,'GBA','App and web based',1,0,'2025-04-19 00:00:00','2025-02-27 11:29:28','2025-02-27 11:29:28'),(21,'data','Data protection detector crime',1,0,'2025-02-28 00:00:00','2025-02-27 14:40:30','2025-02-27 14:40:30');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('HlSsP3oLATdjhZFC4j7LOAF3QmrLr9ny2iEq6vC2',NULL,'127.0.0.1','Dart/3.7 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVVWc3RvWTd2dGVZTFo0N3pvSGVRVzk0RHVkU00zWWpmcHh0VzRDVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740479120),('Io1enJmDKyuD8N53vkKWx3OxQ0geLB6mCLQe4cMR',NULL,'127.0.0.1','Dart/3.7 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnQ0aXkwcXZ0MUcyQWdzYkNlczRseDlYOVpDZGlOcGMzVWFGRmlaOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740478093),('n04Y8gwMZSb69diqiJKpcetGxQKHnFLNw95ELb8x',NULL,'127.0.0.1','Dart/3.7 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUFXcWNoakNVbUswVmprbjFaYlFhejFBNjJET1RpNkhnUDdCV1BUYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740479015),('x6chzBs41SaQ69vlPTURJIir43zmeU4r3keZHks9',NULL,'127.0.0.1','Dart/3.7 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk5HQWJneU1GZGJMczlDRzJlSzd3NlpCMThrRUhrSktzQVM5bndjYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740478409);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Normal',NULL,NULL),(2,'Medium',NULL,NULL),(3,'High',NULL,NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Personal Development','2025-02-23 07:00:03','2025-02-23 07:00:03'),(2,'Self-care','2025-02-23 07:00:03','2025-02-23 07:00:03'),(3,'Health','2025-02-23 07:00:03','2025-02-23 07:00:03'),(4,'Fitness','2025-02-23 07:00:03','2025-02-23 07:00:03'),(5,'Education','2025-02-23 07:00:03','2025-02-23 07:00:03'),(6,'Reading','2025-02-23 07:00:03','2025-02-23 07:00:03'),(7,'Family','2025-02-23 07:00:03',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_for_tasks`
--

DROP TABLE IF EXISTS `tags_for_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_for_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_for_tasks`
--

LOCK TABLES `tags_for_tasks` WRITE;
/*!40000 ALTER TABLE `tags_for_tasks` DISABLE KEYS */;
INSERT INTO `tags_for_tasks` VALUES (1,'bugs'),(2,'Features'),(3,'documentation'),(4,'Enhancement');
/*!40000 ALTER TABLE `tags_for_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_tags`
--

DROP TABLE IF EXISTS `task_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `tag_id` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_tags`
--

LOCK TABLES `task_tags` WRITE;
/*!40000 ALTER TABLE `task_tags` DISABLE KEYS */;
INSERT INTO `task_tags` VALUES (1,1,'[\"1,4\"]'),(2,2,'[\"3,5\"]'),(3,7,'[\"1,3\"]'),(4,8,'[\"1,4,2\"]'),(5,9,'[\"1,4,5\"]'),(7,11,'[\"1\", \"3\", \"4\"]'),(8,12,'[\"1\", \"2\"]'),(9,13,'[\"1\", \"2\"]'),(10,14,'[\"1\"]'),(11,15,'[\"1\"]'),(12,16,'[\"1\"]'),(13,17,'[\"1\"]'),(14,18,'[\"2\"]'),(15,19,'[\"1\"]'),(16,20,'[\"1\"]'),(17,21,'[\"1\"]'),(19,23,'[\"2\"]'),(28,32,'[\"4\"]');
/*!40000 ALTER TABLE `task_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  KEY `tasks_status_id_foreign` (`status_id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Create Authentication','use passport and generate token',1,1,6,'2025-02-28 23:59:00','2025-02-23 09:07:04','2025-02-23 09:07:04'),(2,'Crud','Generate API for CRUD',2,3,6,'2025-02-28 23:59:00','2025-02-23 09:11:24','2025-02-23 09:11:24'),(4,'Document api using swagger ','Make authentication',2,1,7,'2025-02-28 23:59:00','2025-02-25 06:45:22','2025-02-25 06:45:22'),(5,'Prepare project envirnonment','Make authentication',2,1,7,'2025-02-28 23:59:00','2025-02-25 06:48:17','2025-02-25 06:48:17'),(6,'Create manager Trips module','Make authentication',1,1,7,'2025-02-28 23:59:00','2025-02-25 06:59:40','2025-02-25 06:59:40'),(7,'Create crud','Make create,read,update,delete',2,1,13,'2025-02-28 23:59:00','2025-02-26 03:59:37','2025-02-26 03:59:37'),(8,'Create crud','Make create,read,update,delete',1,3,11,'2025-02-28 23:59:00','2025-02-26 04:30:20','2025-02-26 04:30:20'),(9,'Create crud','Make create,read,update,delete',1,1,11,'2025-02-28 23:59:00','2025-02-27 04:16:57','2025-02-27 04:16:57'),(11,'Add social login',NULL,3,2,7,'2025-02-28 23:59:00','2025-02-27 05:09:49','2025-02-27 05:09:49'),(12,'Data normation','Check database if table are designed professional',3,3,8,'2025-02-28 23:59:00','2025-02-27 05:29:59','2025-02-27 05:29:59'),(13,'Data normation','Check database if table are designed professional',3,3,8,'2025-02-28 23:59:00','2025-02-27 05:30:42','2025-02-27 05:30:42'),(14,'Test','This test is for create task',4,2,8,'2025-03-30 00:00:00','2025-02-27 06:35:11','2025-02-27 06:35:11'),(15,'Test','This test is for create task',4,2,8,'2025-03-30 00:00:00','2025-02-27 06:41:19','2025-02-27 06:41:19'),(16,'Test','This test is for create task',4,2,8,'2025-03-30 00:00:00','2025-02-27 06:50:22','2025-02-27 06:50:22'),(17,'Test','This test is for create task',4,2,8,'2025-03-30 00:00:00','2025-02-27 06:51:15','2025-02-27 06:51:15'),(18,'new','New',3,2,8,'2025-02-28 00:00:00','2025-02-27 06:59:30','2025-02-27 06:59:30'),(19,'New test task','Description',5,1,8,'2025-02-28 00:00:00','2025-02-27 07:08:12','2025-02-27 07:08:12'),(20,'New test task','Description',5,1,8,'2025-02-28 00:00:00','2025-02-27 07:09:41','2025-02-27 07:09:41'),(21,'New test task','Description',5,1,8,'2025-02-28 00:00:00','2025-02-27 07:09:51','2025-02-27 07:09:51'),(23,'Ty','efr',3,1,7,'2025-03-06 00:00:00','2025-02-27 07:26:13','2025-02-27 07:26:13');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `user_id` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,6,'[\"1,2\"]'),(2,7,'[\"2\"]'),(3,8,'[\"2,7\"]'),(4,9,'[\"1,2\"]'),(5,10,'[\"1,2\"]'),(6,11,'[\"2,3\"]'),(7,12,'[\"2\", \"3\", \"6\"]'),(8,13,'[\"4\", \"6\"]'),(9,14,'[\"2\", \"4\"]'),(10,15,'[\"3\"]'),(11,16,'[\"2\", \"4\"]'),(12,17,'[\"2\", \"4\", \"6\"]'),(13,18,'[\"3\", \"5\"]'),(14,19,'[\"2\", \"4\"]'),(15,20,'[\"2\"]'),(16,21,'[\"2\"]');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Eric','Kwizera','emmizokwizera@gmail.com',NULL,'$2y$12$Khu4y.5vtEEWVQ/99LeNBe1IHYsQy960WfDBM68FJx6fnIp5r1tAa','','',1,'2025-02-23 06:54:46','2025-02-23 06:54:46',NULL,NULL,NULL,NULL),(2,'Emmizo','Kwizera','emmizokwizera2@gmail.com',NULL,'$2y$12$cHYt/L1AEilpAZWfi6vhFOXtGyaPU3Tzwm5TsbnTzsjU7L.U2njvW',NULL,'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg',1,'2025-02-23 07:52:05','2025-02-23 07:52:05',NULL,NULL,NULL,NULL),(3,'Andre','Tate','emmizokwizera24@gmail.com',NULL,'$2y$12$aEu/zy4OKC9Tsiuk2kVr1eRFYImiOGYCouAL/Ui7A0lf96Ysm4Gia',NULL,'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg',1,'2025-02-23 17:55:29','2025-02-23 17:55:29',NULL,NULL,NULL,NULL),(4,'Hilario','Tuyizshime','hira@gmail.com',NULL,'$2y$12$SJYy3VYMjVEW1N./gM7MVuesQ0lcNOtnDVIDqoIH5d3DD4r54ZbHe',NULL,NULL,1,'2025-02-23 18:11:06','2025-02-23 18:11:06',NULL,NULL,NULL,NULL),(5,'Hilario','Tuyizshime','hillaire@gmail.com',NULL,'$2y$12$pa0vRLuDNOQOWbMRzgnCZeg7.V7RIwsoYGtJ.N6xqCKH8kVtYmtwS',NULL,NULL,1,'2025-02-23 18:18:15','2025-02-23 18:18:15',NULL,NULL,NULL,NULL),(6,'Muganga','Mource','muganga@gmail.com',NULL,'$2y$12$EqqVVBEE9EAD4UT.zog3/uul/ASr7Qk5BU4TSmzK9Powr21ANT5Am',NULL,NULL,1,'2025-02-24 13:38:25','2025-02-24 13:38:25',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 20:54:24
