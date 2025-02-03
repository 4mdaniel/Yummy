-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Fev-2025 às 23:31
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `yummy`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(4, 'Sobremesas', 'Doces e sobremesas deliciosas'),
(5, 'Pratos principais', 'Refeições completas'),
(6, 'Bebidas', 'Sumos, coquetéis e outras bebidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `tags` text NOT NULL,
  `preparation_time` int(11) NOT NULL,
  `steps` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `recipes`
--

INSERT INTO `recipes` (`id`, `active`, `title`, `description`, `tags`, `preparation_time`, `steps`, `user_id`, `category_id`, `created_at`) VALUES
(75, 0, 'Pudim de leite condensado simples', 'Aquela receita que ninguém dispensa: veja como fazer pudim de leite condensado simples e rápido, em um passo a passo de apenas 40 minutos. Contando com apenas 5 ingredientes, essa receita de pudim de leite consensado é sucesso garantido!', '', 40, '1 \r\nCalda\r\nEm uma panela, misture a água e o açúcar até formar uma calda.\r\n\r\n2\r\nUnte uma forma com a calda e reserve.\r\n\r\n3\r\nMassa\r\nBata todos os ingredientes no liquidificador e despeje na forma caramelizada.\r\n\r\n4\r\nLeve para assar em banho-maria por 40 minutos.\r\n\r\n5\r\nDesenforme e sirva.', 23, NULL, '2025-02-03 22:22:30'),
(76, 0, 'Torta de frango', 'Essa receita de torta de frango de liquidificador é deliciosa e muito prática para o dia a dia. Além de ser perfeita para levar para a festa junina da família. Não à toa, é uma das nossa campeãs de acessos. Por ser feita no liquidificador, a massa é líquida e a montagem é diferente de uma torta de frango tradicional. Você deve despejar metade dela na forma untada, adicionar o recheio e cobri-lo com o restante da massa. Se quiser, adicione um pouco de queijo ralado em cima para gratinar no forno antes de cozinhar. A torta de frango com massa de liquidificador é muito mais prática de fazer do que um empadão, por exemplo, já que você não precisa misturar farinha e manteiga, abrir a massa e cobrir a forma manualmente. Se você busca praticidade, essa é a receita ideal! Aprenda agora mesmo a fazer essa torta de frango simples e fácil!', '', 40, '1\r\nRecheio:\r\nCozinhe o peito de frango no caldo até ficar macio.\r\n\r\n2\r\nSepare 1 xícara (chá) de caldo do cozimento e reserve.\r\n\r\n3\r\nRefogue os demais ingredientes e acrescente as ervilhas por último.\r\n\r\n4\r\nDesfie o frango, misture ao caldo e deixe cozinhar até secar.\r\n\r\n5\r\nMassa:\r\nBata o leite, o óleo e os ovos no liquidificador em velocidade baixa.\r\n\r\n6\r\nAcrescente aos poucos a farinha, o sal e o fermento.\r\n\r\n7\r\nDespeje metade da massa em uma forma untada e adicione o recheio sobre ela.\r\n\r\n8\r\nCubra com o restante de massa e o queijo ralado.\r\n\r\n9\r\nLeve ao forno preaquecido (180° C) até dourar.', 23, NULL, '2025-02-03 22:25:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `ingredient` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `ingredient`) VALUES
(95, 75, NULL, '1 lata de leite condensado'),
(96, 75, NULL, '1 xícara de leite de vaca'),
(97, 75, NULL, '4 ovos inteiros'),
(98, 75, NULL, '1 xícara (chá) de açúcar'),
(99, 75, NULL, '1/3 de xícara (chá) de água'),
(100, 76, NULL, '500 g de peito de frango sem pele'),
(101, 76, NULL, '1/2 litro de caldo de galinha'),
(102, 76, NULL, '4 colheres (sopa) de óleo'),
(103, 76, NULL, '1 dente de alho amassado'),
(104, 76, NULL, '1 cebola picada'),
(105, 76, NULL, '3 tomates sem pele e sem sementes'),
(106, 76, NULL, '1 xícara (chá) de ervilhas'),
(107, 76, NULL, 'sal a gosto'),
(108, 76, NULL, 'pimenta-do-reino a gosto'),
(109, 76, NULL, '250 ml de leite'),
(110, 76, NULL, '3/4 de xícara (chá) de óleo'),
(111, 76, NULL, '2 ovos'),
(112, 76, NULL, '1 e 1/2 xícara (chá) de farinha de trigo'),
(113, 76, NULL, 'sal a gosto'),
(114, 76, NULL, '1 colher (sopa) de fermento em pó'),
(115, 76, NULL, 'queijo ralado a gosto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recipe_photos`
--

CREATE TABLE `recipe_photos` (
  `id` int(11) NOT NULL,
  `orderby` int(11) NOT NULL DEFAULT 0,
  `recipe_id` int(11) DEFAULT NULL,
  `photo_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `preferences` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `bio`, `profile_picture`, `preferences`, `created_at`, `active`) VALUES
(11, 'Pedro', '123@gmail.com', '$2y$10$tIp5lqfDUZYaE2fjBnKG7eTYczxgQeE/wvoJZ2/XOWdpJ2gABZssa', 'dawd', NULL, NULL, '2024-12-10 11:04:15', 1),
(12, 'daniel', 'a14345@gmail.com', '$2y$10$P44ByeohzCVpuSfBgoFzou2sw.4NDrVwwyhNVT.JepEuox6ETPRoK', NULL, NULL, NULL, '2024-12-10 11:06:03', 1),
(13, 'aaaaaa', 'aaa@gmail.com', '$2y$10$f9L./KPgxvDc0F6XcLzxdeg44DZaZzeIBbEjdiPC35aQhHV.RoRJe', NULL, NULL, NULL, '2024-12-10 11:08:24', 1),
(14, '', '', '$2y$10$VZpxiAqAWzHeCphzQ7VkTOAM4RkBiilDMv0u9bPSqG5/yWTHr0dDq', NULL, NULL, NULL, '2024-12-10 16:30:03', 0),
(18, 'asdasd', '12223@gmail.com', '$2y$10$Y7pJf8Zi1p1Q/.R43c/xcOxgP9WMtm4ThEL/79AOMPza9B3laI0Cq', NULL, NULL, NULL, '2024-12-10 16:30:56', 0),
(20, 'Daniel', 'arroba@gmail.com', '$2y$10$ISWoiBEFMlk13LInZ8iiYOE9k0EOJDWS2PjXo5rVXs43NE/q6JTNK', NULL, NULL, NULL, '2025-01-14 09:09:09', 0),
(21, 'Sa Gay', 'sa@gmail.com', '$2y$10$QnSLPbRSsz5MEOhHoO6A1OlAzJ6YLozLKTa5QZNMQOG66GVGogPE.', NULL, NULL, NULL, '2025-01-14 09:10:20', 0),
(22, 'Pedrinhoow', '124@gmail.com', '$2y$10$bMiM6V8Tm0jEN8mM4FDJreAY0YgV6dsI19q1w2LWQLe1MXEc0K0GS', NULL, NULL, NULL, '2025-01-23 16:49:08', 0),
(23, 'DanielH', '111@gmail.com', '$2y$10$aTpDU5UcamQtJpJE6D09oeXWMGWHQ7r6f6za4Sg.JPumG7HGbGrXu', NULL, NULL, NULL, '2025-02-02 23:23:04', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `view_history`
--

CREATE TABLE `view_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Índices para tabela `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Índices para tabela `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Índices para tabela `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Índices para tabela `recipe_photos`
--
ALTER TABLE `recipe_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `view_history`
--
ALTER TABLE `view_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de tabela `recipe_photos`
--
ALTER TABLE `recipe_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `view_history`
--
ALTER TABLE `view_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `recipe_photos`
--
ALTER TABLE `recipe_photos`
  ADD CONSTRAINT `recipe_photos_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `view_history`
--
ALTER TABLE `view_history`
  ADD CONSTRAINT `view_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `view_history_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
