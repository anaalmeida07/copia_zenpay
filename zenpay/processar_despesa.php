<?php
require_once 'conexao.php';


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $valor = $_POST['valor'];
    $categoria = $_POST['categoria'];
    $conta_bancaria_id = $_POST['conta_bancaria_id'];
    $usuario_id = $_SESSION['usuario_id'];

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // ...
    
        if (isset($_POST['conta_bancaria_id']) && !empty($_POST['conta_bancaria_id'])) {
            $conta_bancaria_id = $_POST['conta_bancaria_id'];
            // ... (resto do código)
        } else {
            echo "Por favor, selecione uma conta bancária.";
            // Redirecionar para uma página de erro ou exibir uma mensagem de erro mais amigável
        }
    }

    // Insere a despesa na tabela despesas_usuario
    $sql = "INSERT INTO despesas_usuario (usuario_id, valor, conta_bancaria_id, categoria, data_despesa) VALUES (?, ?, ?, ?, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("idis", $usuario_id, $valor, $conta_bancaria_id, $categoria);

    if ($stmt->execute()) {
        // Atualiza o saldo da conta bancária
        $sql_update = "UPDATE contas_bancarias SET saldo = saldo - ? WHERE conta_bancaria_id = ?";
        $stmt_update = $conn->prepare($sql_update);
        $stmt_update->bind_param("di", $valor, $conta_bancaria_id);
        if ($stmt_update->execute()) {
            header('Location: home.php?despesa=sucesso');
        } else {
            echo "Erro ao atualizar saldo: " . $stmt_update->error;
        }
        $stmt_update->close();
    } else {
        echo "Erro ao inserir despesa: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
