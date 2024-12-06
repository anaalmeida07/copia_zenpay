<?php
require_once "conexao.php";

// Inicia a sessão
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $senha = trim($_POST['senha']);

    // Verificar a autenticidade do usuário
    $sql = "SELECT usuario_id, senha FROM usuarios WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Verificar a senha
        if (password_verify($senha, $row['senha'])) {
            // Autenticação bem-sucedida, define a sessão com o usuário
            $_SESSION['usuario_id'] = $row['usuario_id']; // Guarda o ID do usuário
            $_SESSION['username'] = $username; // Guarda o username

            // Redireciona para a página inicial
            header('Location: home.php');
            exit;
        } else {
            // Senha incorreta
            header('Location: login.php?erro=senha');
            exit;
        }
    } else {
        // Usuário não encontrado
        header('Location: login.php?erro=usuario');
        exit;
    }

    $stmt->close();
}

$conn->close();
?>
