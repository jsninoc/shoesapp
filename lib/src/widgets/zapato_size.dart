import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({ 
    this.fullScreen = false
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ZapatoDescPage())
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: this.fullScreen ? 5 : 30, 
          vertical: this.fullScreen ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
            color: Color(0xFFFFCF53),
            borderRadius: this.fullScreen 
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(50), 
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(20), 
                  topRight: Radius.circular(20)
                ) 
              : BorderRadius.circular(50)
          ),
          child: Column(
            children: <Widget>[
              _ZapatoConSombra(),
              if(!this.fullScreen)
              _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage)
          )
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEAA14E),
              blurRadius: 40
            )
          ]
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: this.numero == zapatoModel.talla ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero == zapatoModel.talla)
            BoxShadow(
              color: Color(0xFFF1A23A),
              blurRadius: 10,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: this.numero == zapatoModel.talla ? Colors.white : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}