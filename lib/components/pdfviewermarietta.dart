import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class pdfviewermarietta extends StatefulWidget{

  @override
  _pdfviewermariettaState createState() => _pdfviewermariettaState();
}
class _pdfviewermariettaState extends State<pdfviewermarietta>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmariettafile();
  }
  PDFDocument marietta;
  loadmariettafile() async{
    marietta= await PDFDocument.fromURL("https://www.kennesaw.edu/maps/docs/marietta-map-fall-2020-v5.pdf");
    setState(() {
      marietta = marietta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PDFViewer(document: marietta),
    );
  }
}