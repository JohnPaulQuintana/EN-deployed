<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\QrModel;
use Codedge\Fpdf\Fpdf\Fpdf;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class QrcodeController extends Controller
{
    public function generateQrCode(Request $request){

        $type = $request->input('type');
        $count = intval($request->input('count'));
        $size = intval($request->input('size'));
        

        $existQrcodes = QrModel::where('type','=','Teacher')->where('type','=','Student')->first();
        if (!$existQrcodes) {
            //insert it to qrcodes table
            $qrcodeTable = QrModel::create([
                'type'=>'Teacher', 
                'path'=>'qrcodes/' . "Teacher" . '.png',
            ]);
            $qrcodeTable2 = QrModel::create([
                'type'=>'Student', 
                'path'=>'qrcodes/' . "Student" . '.png',
            ]);

            $randomCode = str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
            $qrCodeDataGenerate = "type: Eastwoods, code: $randomCode";
            $qrCode = (string)QrCode::format('png')
            ->size($size)
            ->backgroundColor(255, 255, 255)
            ->color(0, 0, 0)   
            ->generate($qrCodeDataGenerate);

             // Save the QR code image to the public folder
            $qrCodePath = public_path('qrcodes/authenticate.png');
            file_put_contents($qrCodePath, $qrCode);

             $path = $this->generateQRCodesPdf($type, $count, $size);

            return response()->json(['path'=>$path]);
        }
        
        // if ($type === 'a') {

           
        // }
        
       
    }

    public function generateQRCodesPdf($type, $count, $size)
    {
        $pdf = new Fpdf('P', 'mm', 'A4');//custom class for generating table
        $pdf->SetMargins(10, 10, 10); // Set left, top, and right margins to 10mm
        $pdf->AddPage();

        // Header
        $pdf->SetFont('Courier', 'B', 18);
        $pdf->Cell(0, 10, 'Exousia Navi Generated Qrcodes', 0, 1, 'C');
        $pdf->SetFont('Courier', '', 12);
        $pdf->Cell(0, 5, 'Date Created: '.Carbon::now()->format('Y-m-d'), 0, 1, 'C');
        $pdf->Ln(10);
    
        // Set the size and spacing for QR codes
        $qrCodeSize = 20;
        $spacing = 4;
    
        // Calculate the number of QR codes that can fit in a row
        //210 x 297 w and h in mm
        $qrCodesPerRow = floor((210 - 10) / ($qrCodeSize + $spacing));

        // Initial vertical position for QR codes below the header
        $initialY = $pdf->GetY();

       // Ensure that $qrCodesPerRow is not zero before calculating $totalRows
        $totalRows = ($qrCodesPerRow != 0) ? ceil($count / $qrCodesPerRow) : 0;

    
        // Font settings for the name text
        $pdf->SetFont('Arial', 'B', 10);
    
        // Loop through the rows
        for ($row = 0; $row < $totalRows; $row++) {
            // Loop through the QR codes in the current row
            for ($col = 0; $col < $qrCodesPerRow; $col++) {
                $index = $row * $qrCodesPerRow + $col;
                // dd($qrCodeData[$index]->path);
                // Check if there are more QR codes to process
                if ($index >= $count) {
                    break;
                }
    
                // Calculate the position for the QR code
                $x = 10 + $col * ($qrCodeSize + $spacing);
                $y = $initialY + $row * ($qrCodeSize + $spacing);

               

                // add to the PDF
                $pdf->Image(public_path('qrcodes/authenticate.png'), $x, $y, $qrCodeSize, $qrCodeSize);

                
            }
        }

        // Generate a unique filename with a random 6-digit number
        $randomNumber = str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
    
        // Output the PDF
        $pdfPath = public_path('qrPdf/qrcodes_'.$randomNumber.'.pdf');
        $pdf->Output('F', $pdfPath);
    
        return 'qrPdf/qrcodes_'.$randomNumber.'.pdf';
    }
}
