<?php
ob_start();
session_start();
include("includes/config.php");

if (isset($_SESSION["useremail"])) {
    header("location: dashboard.php");
    exit();
}

if (isset($_POST["login"])) {
    $useremail = $_POST["user"];
    $userpass = $_POST["pass"];

    // Prepared statement: input pengguna tidak pernah digabung ke teks query
    $stmt = mysqli_prepare($conn, "SELECT admin_ID, admin_USER, admin_PASS FROM admin WHERE admin_USER = ?");
    mysqli_stmt_bind_param($stmt, "s", $useremail);
    mysqli_stmt_execute($stmt);
    $row_admin = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
    mysqli_stmt_close($stmt);

    $valid = false;
    if ($row_admin) {
        $stored = rtrim($row_admin["admin_PASS"]);
        if (password_get_info($stored)["algoName"] !== "unknown") {
            // Password sudah berupa hash
            $valid = password_verify($userpass, $stored);
        } else {
            // Password lama masih teks biasa: terima sekali, lalu ubah menjadi hash
            $valid = hash_equals($stored, $userpass);
            if ($valid) {
                $hash = password_hash($userpass, PASSWORD_DEFAULT);
                $upd = mysqli_prepare($conn, "UPDATE admin SET admin_PASS = ? WHERE admin_ID = ?");
                mysqli_stmt_bind_param($upd, "ss", $hash, $row_admin["admin_ID"]);
                mysqli_stmt_execute($upd);
                mysqli_stmt_close($upd);
            }
        }
    }

    if ($valid) {
        session_regenerate_id(true);
        $_SESSION["useremail"] = $row_admin["admin_USER"];
        header("location: dashboard.php");
        exit();
    } else {
        echo "<script>alert('Email atau password salah!');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <title>Dashboard Tugas Akhir</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
    <div class="container">
        <!-- kolom kiri -->
        <div class="kolomkiri col-md-4 text-center">
            <h2>TUGAS AKHIR</h2>
            <p>My Profile</p>
            <p>INI UNTUK PROFILE ANDA</p>
        </div>

        <!-- kolom kanan -->
        <div class="kolomkanan col-md-8">
            <div class="login-box">
                <h5 class="text-center mb-4">LOGIN</h5>
                <form method="POST">
                    <div class="mb-3">
                        <input type="email" class="form-control" placeholder="Enter Email" name="user" required>
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" placeholder="Enter Password" name="pass" required>
                    </div>
                    <input type="submit" class="btn btn-login" value="Login" name="login">
                </form>
            </div>
        </div>
    </div>

</body>
<?php
mysqli_close($conn);
ob_end_flush();
?>

</html>