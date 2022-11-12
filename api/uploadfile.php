<?php

    require_once('./db.php');

    try {
        $object = new stdClass();

        if($_SERVER['REQUEST_METHOD'] == 'POST') {
            $filename_img = $_FILES['file']['name'][0];
            $filename_zip = $_FILES['file']['name'][1];
            
            $ext_img = pathinfo($filename_img, PATHINFO_EXTENSION);
            $ext_zip = pathinfo($filename_zip, PATHINFO_EXTENSION);
            
            $allowed_img = array('jpg', 'png', 'jpeg');
            $allowed_zip = array('rar', 'zip');
            if(   !in_array($ext_img, $allowed_img) && !in_array($ext_zip, $allowed_zip)  ) {
                $object->RespCode = 400;
                $object->RespMessage = 'error 2';
                echo json_encode($object);
                http_response_code(400);
            }
            else {
                
                $filename_img = str_replace(' ', "", $filename_img);
                $filename_zip = str_replace(' ', "", $filename_zip);

                $milliseconds = round(microtime(true) * 1000);
                $newfilename_img = 'm' . $milliseconds . "." . $ext_img;
                $newfilename_zip = 'z' . $milliseconds . "." . $ext_zip;

                $tmpname_img = $_FILES['file']['tmp_name'][0];
                $tmpname_zip = $_FILES['file']['tmp_name'][1];
                $moveto_img = '../uploads/imgs/' . $newfilename_img;
                $moveto_zip = '../uploads/zip/' . $newfilename_zip;


                if(move_uploaded_file($tmpname_img, $moveto_img) && move_uploaded_file($tmpname_zip, $moveto_zip)) {
                    chmod('../uploads/imgs/'.$newfilename_img, 0777);
                    chmod('../uploads/zip/'.$newfilename_zip, 0777);
                    $object->RespCode = 200;
                    $object->RespMessage = 'success';
                    $object->Result = new stdClass();
                    $object->Result->file1 = $newfilename_img;
                    $object->Result->file2 = $newfilename_zip;
                    http_response_code(200);
                    echo json_encode($object);
                }
                else {
                    $object->RespCode = 400;
                    $object->RespMessage = 'error 1';
                    echo json_encode($object);
                    http_response_code(400);
                }
            }
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
