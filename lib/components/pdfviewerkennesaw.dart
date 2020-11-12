import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class pdfviewerkennesaw extends StatefulWidget{
  @override
  _pdfviewerkennesawState createState() => _pdfviewerkennesawState();
}
class _pdfviewerkennesawState extends State<pdfviewerkennesaw>{

  PDFDocument kennesaw;

  loadKennesawFile() async{
    kennesaw= await PDFDocument.fromURL("https://www.kennesaw.edu/maps/docs/kennesaw-parking-map-fall-2020.pdf");
    setState(() {
      kennesaw = kennesaw;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadKennesawFile();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PDFViewer(document: kennesaw),
    );
  }
}