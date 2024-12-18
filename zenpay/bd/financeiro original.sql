-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/12/2024 às 23:05
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_bancarias`
--

CREATE TABLE `contas_bancarias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `tipo_conta` varchar(40) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contas_bancarias`
--

INSERT INTO `contas_bancarias` (`id`, `usuario_id`, `nome`, `tipo_conta`, `saldo`) VALUES
(2, 51, 'Itaú', 'Corrente', 810.36),
(3, 51, 'Bradesco', 'Corrente', 20.00),
(4, 51, 'Nubank', 'Corrente', 30.00),
(5, 51, 'Santander', 'Corrente', 1000.00),
(6, 51, 'Inter', 'Corrente', 543.00),
(7, 51, 'PicPay', 'Corrente', 5.00),
(8, 51, 'BMG', 'Corrente', 75.00),
(9, 50, 'Nubank', 'Corrente', 150.00),
(10, 50, 'Bradesco', 'Corrente', 100.00),
(11, 53, 'Iti', 'Corrente', 1000.00),
(12, 53, 'Bradesco', 'Corrente', 5.00),
(13, 54, 'Nubank', 'Corrente', 84400.00),
(14, 51, 'Iti', 'Corrente', 400.00),
(15, 55, 'Nubank', 'Corrente', 6389.00),
(16, 55, 'Bradesco', 'Corrente', 1230.00),
(17, 56, 'Bradesco', 'Corrente', 60.00),
(18, 56, 'Nubank', 'Corrente', 520.36),
(19, 57, 'Iti', 'Corrente', 1700.00),
(20, 58, 'Iti', 'Corrente', 1920.36),
(21, 58, 'Bmg', 'Corrente', 3012.00),
(22, 58, 'Nubank', 'Corrente', 900.00),
(23, 58, 'Sofisa', 'Corrente', 70.36),
(24, 58, 'Itaú', 'Corrente', 122.00),
(25, 58, 'Bradesco', 'Corrente', 11.00),
(26, 58, 'Banco PAN', 'Corrente', 10.00),
(27, 58, 'Banco de Brasília', 'Corrente', 2.00),
(28, 58, 'Picpay', 'Corrente', 10.00),
(29, 58, 'Bradesco', 'Corrente', 1.00),
(30, 58, 'Banco do Brasil', 'Corrente', 1.00),
(31, 58, 'Santander', 'Corrente', 1.00),
(32, 58, 'BTG Pactual', 'Corrente', 1.00),
(33, 58, 'Inter', 'Corrente', 1.00),
(34, 58, 'C6', 'Corrente', 2012.00),
(35, 58, 'Banrisul', 'Corrente', 10.00),
(36, 58, 'BTG Pactual', 'Corrente', 10.00),
(37, 51, 'C6', 'Corrente', 1010.00),
(38, 51, 'Banco de Brasília', 'Corrente', 10.00),
(39, 59, 'Nubank', 'Corrente', 2040.00),
(40, 59, 'Inter', 'Corrente', 600.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `despesas_usuario`
--

CREATE TABLE `despesas_usuario` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `conta_id` int(11) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `data_despesa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `despesas_usuario`
--

INSERT INTO `despesas_usuario` (`id`, `usuario_id`, `valor`, `conta_id`, `categoria`, `data_despesa`) VALUES
(1, 51, 75.00, 3, 'Bermuda', '2024-05-16 00:00:00'),
(2, 51, 5.00, 3, 'Salgado', '2024-05-16 00:00:00'),
(3, 51, 20.00, 4, 'Feira', '2024-05-16 00:00:00'),
(4, 51, 90.00, 5, 'saúde', '2024-05-22 00:00:00'),
(5, 51, 2.99, 6, 'lanche', '2024-05-22 00:00:00'),
(6, 51, 5.00, 5, 'salgado', '2024-05-23 00:00:00'),
(7, 51, 1500.00, 7, 'blaze', '2024-05-23 00:00:00'),
(8, 51, 5.00, 5, 'lanche', '2024-05-23 00:00:00'),
(9, 51, 55.00, 5, 'saúde', '2024-05-23 00:00:00'),
(10, 51, 5.00, 5, 'lazer', '2024-05-24 00:00:00'),
(11, 51, 200.00, 5, 'roupa', '2024-05-24 14:53:38'),
(12, 51, 5.00, 8, 'lazer', '2024-05-25 03:51:53'),
(13, 51, 500.00, 7, 'jogo do bicho', '2024-05-25 19:04:35'),
(14, 50, 2000.00, 10, 'lazer', '2024-05-25 19:39:34'),
(15, 50, 50.00, 9, 'lanche', '2024-05-25 19:39:56'),
(16, 53, 50.00, 11, 'presente', '2024-05-28 16:00:50'),
(17, 53, 1200.00, 11, 'aluguel', '2024-05-28 16:02:07'),
(18, 53, 50.00, 11, 'almoço', '2024-05-28 11:09:57'),
(19, 54, 600.00, 13, 'Carro', '2024-05-29 13:27:17'),
(20, 51, 5.00, 2, 'lanche', '2024-05-29 14:46:32'),
(21, 55, 30.00, 16, 'LOL', '2024-05-29 14:53:25'),
(22, 55, 1200.00, 15, 'aluguel', '2024-05-29 14:53:43'),
(23, 56, 5.00, 17, 'lanche', '2024-05-29 15:21:44'),
(24, 56, 10.00, 17, 'casa', '2024-05-29 15:22:08'),
(25, 51, 2000.00, 2, 'casa', '2024-06-12 10:18:01'),
(26, 51, 75.00, 6, 'lazer', '2024-06-12 10:18:24'),
(27, 51, 500.00, 2, 'aluguel', '2024-07-04 23:48:35'),
(28, 57, 500.00, 19, 'aluguel', '2024-10-26 11:17:13'),
(29, 58, 100.00, 20, 'lanche', '2024-10-26 11:20:43'),
(30, 58, 20.00, 21, 'almoço', '2024-10-26 11:21:07'),
(31, 58, 100.00, 22, 'saúde', '2024-10-26 11:22:33'),
(32, 51, 500.00, 2, 'lanche', '2024-11-20 16:19:29'),
(33, 58, 100.00, 23, 'saúde', '2024-12-01 15:27:19'),
(34, 58, 10000.00, 22, 'saúde', '2024-12-01 15:58:50'),
(35, 58, 60000.00, 22, 'saúde', '2024-12-01 15:59:18'),
(36, 58, 9000.00, 22, 'saúde', '2024-12-01 15:59:42'),
(37, 51, 100.00, 14, 'saúde', '2024-12-01 16:03:16'),
(38, 51, 50.00, 3, 'saúde', '2024-12-01 21:03:32'),
(39, 51, 100.00, 3, 'almoço', '2024-12-01 21:03:53'),
(40, 59, 500.00, 39, 'saúde', '2024-12-01 21:13:58'),
(41, 59, 500.00, 39, 'lanche', '2024-12-01 21:14:23'),
(42, 51, 1000.00, 37, 'aluguel', '2024-12-01 21:16:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas_usuario`
--

CREATE TABLE `receitas_usuario` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `conta_destino_id` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `data_recebimento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `receitas_usuario`
--

INSERT INTO `receitas_usuario` (`id`, `usuario_id`, `valor`, `conta_destino_id`, `categoria`, `data_recebimento`) VALUES
(1, 51, 75.00, 2, 'Outra fonte de renda', '2024-05-15 00:00:00'),
(2, 51, 100.00, 2, 'Outra fonte de renda', '2024-05-15 00:00:00'),
(3, 51, 75.00, 3, 'Outra fonte de renda', '2024-05-15 00:00:00'),
(4, 51, 75.00, 3, 'Outra fonte de renda', '2024-05-15 00:00:00'),
(5, 51, 40.00, 4, 'Outra fonte de renda', '2024-05-16 00:00:00'),
(6, 51, 100.00, 5, 'Outra fonte de renda', '2024-05-22 00:00:00'),
(7, 51, 2000.00, 7, 'Outra fonte de renda', '2024-05-23 00:00:00'),
(8, 51, 5.00, 7, 'Outra fonte de renda', '2024-05-23 00:00:00'),
(9, 51, 5.00, 5, 'Outra fonte de renda', '2024-05-23 00:00:00'),
(10, 51, 55.00, 5, 'Outra fonte de renda', '2024-05-23 00:00:00'),
(11, 51, 1200.00, 5, 'Outra fonte de renda', '2024-05-24 09:42:17'),
(12, 51, 100.00, 8, 'Outra fonte de renda', '2024-05-24 22:51:34'),
(13, 50, 2000.00, 10, 'Salário', '2024-05-25 14:39:06'),
(14, 53, 300.00, 11, 'Outra fonte de renda', '2024-05-28 11:00:31'),
(15, 53, 2000.00, 11, 'Salário', '2024-05-28 11:01:22'),
(16, 53, 5.00, 12, 'Outra fonte de renda', '2024-05-28 11:02:57'),
(17, 54, 5000.00, 13, 'Salário', '2024-05-29 13:26:44'),
(18, 51, 120.00, 2, 'Outra fonte de renda', '2024-05-29 13:51:55'),
(19, 55, 50.00, 16, 'Outra fonte de renda', '2024-05-29 14:53:00'),
(20, 55, 1200.00, 16, 'Outra fonte de renda', '2024-05-29 14:54:02'),
(21, 56, 500.00, 18, 'Outra fonte de renda', '2024-05-29 15:21:27'),
(22, 56, 75.00, 17, 'Outra fonte de renda', '2024-05-29 15:21:57'),
(23, 51, 1200.00, 2, 'Salário', '2024-06-12 10:17:53'),
(24, 51, 1200.00, 2, 'Outra fonte de renda', '2024-06-12 10:18:10'),
(25, 51, 100.00, 2, 'Outra fonte de renda', '2024-07-04 23:48:26'),
(26, 51, 100.00, 6, 'Outra fonte de renda', '2024-07-07 11:24:16'),
(27, 57, 2000.00, 19, 'Salário', '2024-10-26 11:17:02'),
(28, 57, 100.00, 19, 'Outra fonte de renda', '2024-10-26 11:18:06'),
(29, 58, 2000.00, 20, 'Salário', '2024-10-26 11:19:56'),
(30, 58, 22.00, 21, 'Outra fonte de renda', '2024-10-26 11:20:28'),
(31, 58, 3000.00, 21, 'Outra fonte de renda', '2024-10-26 11:22:06'),
(32, 51, 1000.00, 2, 'Salário', '2024-11-20 12:42:45'),
(33, 58, 50.00, 23, 'Outra fonte de renda', '2024-11-28 20:58:11'),
(34, 58, 100.00, 23, 'Outra fonte de renda', '2024-12-01 15:23:53'),
(35, 51, 500.00, 14, 'Outra fonte de renda', '2024-12-01 16:02:55'),
(36, 51, 2000.00, 37, 'Salário', '2024-12-01 21:09:50'),
(37, 59, 2840.00, 39, 'Salário', '2024-12-01 21:13:25'),
(38, 59, 100.00, 40, 'Outra fonte de renda', '2024-12-01 21:14:06'),
(39, 51, 500.00, 6, 'Outra fonte de renda', '2024-12-01 21:16:29'),
(40, 58, 2000.00, 34, 'Salário', '2024-12-02 17:58:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`) VALUES
(1, 'almeida', 'almeida@almeida', '$2y$10$5SQg7bEZTsW.sle..RajY.EnCR4xOEkpRN1aPu.b/g4X0LAQl3x/m'),
(41, 'ana', 'ana@ana.com', '$2y$10$RLRbcIlqTHaULlS8xVtQpecGTsmAjfw6vISKL/O0yY4hJSuhQy6WO'),
(42, '', '', '$2y$10$V9O44f9x.jDHf.FVOJpxg.0EUV2MSQkBs6O3UrFKZtRzmRE/J25xS'),
(43, 'ana', 'ana@ana.com', '$2y$10$mEpLLNw1kEMQ1m/WzpOsKu81QK6xmRsGjHbI56JHG1j4e/OqHBD4a'),
(44, 'ana', 'ana@ana.com', '$2y$10$.vnPU/W9PF1zoK49VuR3ruY5rosTn/bTJg9Hm1pus6qvAUA.hGQ9i'),
(45, 'carla', 'carla@carla.com', '$2y$10$W2m/a759Q5hC4AulfbsIfe.vNM4As0govfWUq.CEvRbBVT8EQq.L2'),
(46, 'ana', 'ana@ana.com', '$2y$10$4AIQ5TSUFwGDw.MnJHn0K.dvgiihqr1/Zk8os5PJkfVK8v2XmYMum'),
(47, 'luiz', 'luiz@luiz.com', '$2y$10$uJ6W3AT8GERsc0RNdt5dGu4Y/bCqOuhgNME5avhiXc4awomzvJnQy'),
(48, 'bea', 'bea@bea.com', '$2y$10$3xhd.oqstc0RHLCcCzQD/.8XZX.pYDcoHt1KpPSivfPgq1mwpkgX6'),
(49, 'beabe', 'beea@bea.com', '$2y$10$0tW3Dc51YCpgeyk1iPvy8eNpU9YA71fNaQflMSVMIgQR348ap0Pem'),
(50, 'luiz', 'luiz@vambora.com', '$2y$10$WvFh3POysNukGt5PUigohe1dNs7P0bR3kc5Cey0qzHRRmyhj7W2cm'),
(51, 'sepriano', 'sepriano@sepriano.com', '$2y$10$H3dNHm2/bIOZTX5JkIuCIupaAuF7nM1TxfobySdoqB7.N.VQXwBY6'),
(52, 'Ana Paula', 'paula@paula.com', '$2y$10$9NXVXB3c8zYLqQtzGNQWYONQP/iKh/jWNiFEcXva/VLNpsWC7mgo6'),
(53, 'Luiz e Bea', 'luizamabea@bealinda.com', '$2y$10$PuLnMSrawf3IvHRZiGIzwOcxz0PJB3WKj4TP/MxluAQ3PNRWwidX6'),
(54, 'Lucas Sepriano', 'lucassepriano@sepriano.com', '$2y$10$WwF5mPfKkfF1C00Y1SEg4u71QyCgoJeTEnB43DddZ4SqrOdsWJHoi'),
(55, 'kebolas', 'kebolas@gmail.com', '$2y$10$1JhJayUsk/7.FxEtHD6FGOD3VhjQRGh7nZdKtqqNa9A6ewAza1Vf2'),
(56, 'salgado', 'salgado@gmail.com', '$2y$10$QNnQ5c2Hq98.KCKDpg9SI.pdsevY1PvALVdNXpeY0Dr4lEQqPPwYW'),
(57, 'Luiz', 'luizhenriquejow@gmail.com', '$2y$10$34wsoUNHwqphHfscyApSy.Deab0bbiuTiQAsNs30Fwc.ROF7GAYEW'),
(58, 'Sisi', 'simone@sisi.com', '$2y$10$7YQLDD0KSHoZHJlYuC39KeOTyxDbn3rjOwRTkPQ9TezG2.IMjsmpy'),
(59, 'Luiz H', 'luiz@luizz.com', '$2y$10$1/HBZ4DRYPIpRMd1w8yqK.KAUPwfSGklso.7GzXF/GRi9su1EwaJy');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `contas_bancarias`
--
ALTER TABLE `contas_bancarias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `conta_id` (`conta_id`);

--
-- Índices de tabela `receitas_usuario`
--
ALTER TABLE `receitas_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `conta_destino_id` (`conta_destino_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contas_bancarias`
--
ALTER TABLE `contas_bancarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `receitas_usuario`
--
ALTER TABLE `receitas_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  ADD CONSTRAINT `despesas_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `despesas_usuario_ibfk_2` FOREIGN KEY (`conta_id`) REFERENCES `contas_bancarias` (`id`);

--
-- Restrições para tabelas `receitas_usuario`
--
ALTER TABLE `receitas_usuario`
  ADD CONSTRAINT `receitas_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `receitas_usuario_ibfk_2` FOREIGN KEY (`conta_destino_id`) REFERENCES `contas_bancarias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
