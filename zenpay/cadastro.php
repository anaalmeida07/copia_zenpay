<?php
require_once "conexao.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Captura os dados enviados pelo formulário
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];
    $username = $_POST['username'];

    // Cria um hash da senha para armazenamento seguro
    $hashed_password = password_hash($senha, PASSWORD_DEFAULT);

    // Verifica se o username já existe no banco
    $sql_verificar_username = "SELECT username FROM usuarios WHERE username = ?";
    $stmt_verificar = $conn->prepare($sql_verificar_username);
    $stmt_verificar->bind_param("s", $username);
    $stmt_verificar->execute();
    $stmt_verificar->store_result();

    if ($stmt_verificar->num_rows > 0) {
        // Username já existe, exibe mensagem de erro
        echo "<h3>O username '$username' já está em uso. Por favor, escolha outro.</h3>";
    } else {
        // Prepara a consulta para inserir o novo usuário
        $sql = "INSERT INTO usuarios (nome, email, senha, username) VALUES (?, ?, ?, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $nome, $email, $hashed_password, $username);

        if ($stmt->execute()) {
            $usuario_id = $conn->insert_id; // Obtém o ID do usuário inserido
            $_SESSION['usuario_id'] = $usuario_id;
            $_SESSION['username'] = $username;

            // Redireciona para a página inicial com mensagem de sucesso
            header('Location: home.php?cadastro=sucesso');
            exit();
        } else {
            // Exibe mensagem de erro caso a inserção falhe
            echo "Erro ao cadastrar usuário: " . $stmt->error;
        }

        // Fecha o statement
        $stmt->close();
    }

    // Fecha o statement de verificação
    $stmt_verificar->close();
}

// Fecha a conexão com o banco de dados
$conn->close();
?>
