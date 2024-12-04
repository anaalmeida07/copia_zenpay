-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2024 às 20:51
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
  `conta_bancaria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `tipo_conta` varchar(40) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `conta_destino_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contas_bancarias`
--

INSERT INTO `contas_bancarias` (`conta_bancaria_id`, `usuario_id`, `nome`, `tipo_conta`, `saldo`, `conta_destino_id`) VALUES
(3, 6, 'Bradesco', 'corrente', 2000.00, NULL),
(4, 6, 'Sofisa', 'corrente', 10.00, NULL),
(5, 7, 'Banco PAN', 'corrente', 3990.00, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `despesas_usuario`
--

CREATE TABLE `despesas_usuario` (
  `despesas_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `conta_bancaria_id` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `data_despesa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `despesas_usuario`
--

INSERT INTO `despesas_usuario` (`despesas_id`, `usuario_id`, `valor`, `conta_bancaria_id`, `categoria`, `data_despesa`) VALUES
(7, 6, 2000.00, 3, 'ALUGUEL', '2024-12-04 14:54:56'),
(8, 7, 10.00, 5, 'apto', '2024-12-04 16:30:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas_usuario`
--

CREATE TABLE `receitas_usuario` (
  `receitas_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `conta_destino_id` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `data_recebimento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `receitas_usuario`
--

INSERT INTO `receitas_usuario` (`receitas_id`, `usuario_id`, `valor`, `conta_destino_id`, `categoria`, `data_recebimento`) VALUES
(0, 5, 2000.00, 1, 'Salário', '2024-12-04 14:07:04'),
(0, 5, 60.00, 2, 'Outra fonte de renda', '2024-12-04 14:26:58'),
(0, 5, 4000.00, 1, 'Salário', '2024-12-04 14:40:12'),
(0, 5, 3000.00, 2, 'Salário', '2024-12-04 14:41:36'),
(0, 6, 3000.00, 3, 'Salário', '2024-12-04 14:54:46'),
(0, 6, 10.00, 4, 'Outra fonte de renda', '2024-12-04 14:55:30'),
(0, 7, 2000.00, 5, 'Salário', '2024-12-04 16:30:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nome`, `email`, `senha`) VALUES
(1, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$GPEjPdSKn05cF0J0/IKobuM5BFJhenljfPY/YcZymLMuAIKO.Zm3K'),
(2, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$sNfDsHJeQbugu8syZ0XTq.7sEXvrb9jyDRU3QPQh6kv.TWb/NL6Ja'),
(3, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$6BeRZD8zZyze8M7CR8PJ2OBbOARSr2LMyFWLMJC1D0t3ggUPvN2J.'),
(4, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$L8q8aKmSIr3.C.JHcnoxruwzzBS9qlJbYPX0nQGrJt/Zbr.I9EMfG'),
(6, 'ana carla garcia de almeida', 'ana@carla.com', '$2y$10$Gz5FttTWuqwTogYewF3D2OmhT/7hiSbbT1qI2pydXlfLXJbdhKomW'),
(7, 'ligia', 'ligia@piva.com', '$2y$10$/VLT.pmAxchUcBBvFajtU.tcMO57b.sM/kB1RJjz4t6dSh6Vy5t7a'),
(8, 'ligia', 'ligia@piva.com', '$2y$10$SahxRuUf1wQY.Moqp9xO5OogZLMBIDNIYmLP6uwClDIRkrCHQgs7a'),
(9, 'Ligia', 'ligia@piva.com', '$2y$10$dWgZTHx.t3FKSlfxR/GIxuSEqyTGrHKv6A057KPAPnXFBtClNgm8C'),
(10, 'ligia', 'ligia@piva.com', '$2y$10$O8P0I6ULLqOgq1X4oB4nR.yJl4RLU4SgD314AQJBQAV0xJnLvmAbO'),
(11, 'ligia', 'ligia@piva.com', '$2y$10$DlCP2sYy8qpNaJ6/lvOAa.gUN4bMQ19LUE09NJ6tmzft97cw9ufYK'),
(12, 'ligia', 'ligia@piva.com', '$2y$10$JoxKpwE.IS6NP7mu82PscuhI6jbgK4/yFxDhHM5lwi2fE.4byCYOu'),
(13, 'ligia', 'ligia@piva.com', '$2y$10$ELHeFb5sIo1hZyB.jm9ChuAV80oS78mSOfR2S7MNER1Sgn9Hu/TAm'),
(14, 'ligia', 'ligia@piva.com', '$2y$10$pyE4Drhb9pN85Np/96ttju27wG/1L4gpBRGUChHYiNGfhQuyInD3e'),
(16, 'ligia', 'ligia@piva.com', '$2y$10$eBdeZR5Kyi4X0dgERZ3dIuiWmPG666s9hKLy7QK.dRUH1.vcHBK8K'),
(20, 'teste', 'teste@teste.com', '$2y$10$9DAofjUb6e7NZhC5AgRf6.n..gYfVGLMt8GVDUZwFUoNcvQ96cOOC'),
(21, 'teste', 'teste@teste.com', '$2y$10$AitiErlTDxZZDvjpJgEVG.zqsts8thTLkULPFBB./aZCrS9QQZZdO'),
(22, 'teste', 'teste@teste.com', '$2y$10$WWwu/0wmS.f9ZH5qoLrDpOGE4ayFUfa0.8b3/DWUIWMHx3WdRwfSq'),
(23, 'teste', 'teste@teste.com', '$2y$10$tiUW9ZSv7mfXyphig1A9P.J4/s/82EyCKQBRrG6fBQP1jnn5sAL2.'),
(24, 'carla', 'carla@carla.com', '$2y$10$BKDQiPbTcpgMDIukdNJNe.9tTGVv1MTRZ8txj135Jb6pDPPJZJJQ2'),
(25, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$3kESV/1fPDY3sCwGqCFY.ODUBUsjakxwiyUUHjqAZLojk2AKdx9L2'),
(26, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$TaEaudGhMVZ5rfDGz0Lcm.0OkSHdCyENK/5H6Uq7QDkugHoPKrMYu'),
(27, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$k2zm6sPF6MBc0LU9QFkc6OHoYqY/.R9IqqxHzUkbq/P7DpftgbIhe'),
(28, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$XT9PFrOqtXjq4rzFNRlLZeXz2kZwsI7o3qkPHSgPE1TXHQfzFPsJ.'),
(29, 'ana carla garcia de almeida', 'ana@ana.com', '$2y$10$TuaXRMfocian4uGG6Qpp9.w65v0l2vqfigCxZUlbyCcF1SZ/.4NpG');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `contas_bancarias`
--
ALTER TABLE `contas_bancarias`
  ADD PRIMARY KEY (`conta_bancaria_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  ADD PRIMARY KEY (`despesas_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `conta_bancaria_id` (`conta_bancaria_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contas_bancarias`
--
ALTER TABLE `contas_bancarias`
  MODIFY `conta_bancaria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  MODIFY `despesas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contas_bancarias`
--
ALTER TABLE `contas_bancarias`
  ADD CONSTRAINT `contas_bancarias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `despesas_usuario`
--
ALTER TABLE `despesas_usuario`
  ADD CONSTRAINT `despesas_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `despesas_usuario_ibfk_2` FOREIGN KEY (`conta_bancaria_id`) REFERENCES `contas_bancarias` (`conta_bancaria_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
