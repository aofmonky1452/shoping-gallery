<?php

    require_once('./db.php');

    try {
        if($_SERVER['REQUEST_METHOD'] == 'POST') {

            $object = new stdClass();
            $name = $_POST['name'];
            $price = $_POST['price'];
            $description = $_POST['description'];
            $type = $_POST['type'];
            $file1 = $_POST['file1'];
            $file2 = $_POST['file2'];

            $stmt = $db->prepare('insert into sp_product (name,img,price,description,type,filezip) values (?,?,?,?,?,?) ');
            if($stmt->execute([
                $name, $file1, $price, $description, $type, $file2
            ])) {
                $object->RespCode = 200;
                $object->RespMessage = 'success';
                http_response_code(200);
            }
            else {
                $object->RespCode = 500;
                $object->Log = 1;
                $object->RespMessage = 'bad : cant get product';
                http_response_code(500);
            }
            echo json_encode($object);
        }
        else {
            http_response_code(405);
        }
    }
    catch(PEOException $e) {
        http_response_code(500);
        echo $e->getMessage();
    }

?> 