import 'package:flutter/material.dart';

class SquareVotingPage extends StatefulWidget {
  const SquareVotingPage({super.key});

  @override
  _SquareVotingPageState createState() => _SquareVotingPageState();
}

class _SquareVotingPageState extends State<SquareVotingPage> {
  Rect? squareRect; // Rectángulo del cuadrado dibujado
  bool isDragging = false; // Estado de arrastre
  Offset initialDragOffset = Offset.zero; // Offset inicial para mover
  Offset currentDragOffset = Offset.zero; // Offset actual para mover

  // Método para iniciar el dibujo del cuadrado
  void _onPanStart(DragStartDetails details) {
    setState(() {
      squareRect =
          Rect.fromPoints(details.localPosition, details.localPosition);
    });
  }

  // Método para ajustar el tamaño del cuadrado al arrastrar
  void _onPanUpdate(DragUpdateDetails details) {
    if (!isDragging) {
      setState(() {
        squareRect = Rect.fromPoints(
          squareRect!.topLeft,
          details.localPosition,
        );
      });
    } else {
      // Actualizar la posición cuando se arrastra el cuadrado
      setState(() {
        currentDragOffset += details.delta;
      });
    }
  }

  // Método para finalizar el arrastre o el dibujo del cuadrado
  void _onPanEnd(DragEndDetails details) {
    if (squareRect!.width < 20 || squareRect!.height < 20) {
      // Evita crear un cuadrado demasiado pequeño
      setState(() {
        squareRect = null;
      });
    }
  }

  // Método para detectar si se ha tocado dentro del cuadrado
  bool _isWithinSquare(Offset position) {
    if (squareRect == null) return false;
    final shiftedRect =
        squareRect!.shift(currentDragOffset); // Considera el desplazamiento
    return shiftedRect.contains(position);
  }

  // Método para iniciar el arrastre del cuadrado
  void _onDragSquareStart(DragStartDetails details) {
    if (_isWithinSquare(details.localPosition)) {
      setState(() {
        isDragging = true;
        initialDragOffset = details.localPosition;
      });
    }
  }

  // Método para finalizar el arrastre del cuadrado
  void _onDragSquareEnd(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });
  }

  // Método para eliminar el cuadrado
  void _removeSquare() {
    setState(() {
      squareRect = null;
      currentDragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dibuja, Mueve y Elimina Cuadrado sobre Imagen"),
        actions: [
          if (squareRect !=
              null) // Mostrar botón de eliminar solo si hay un cuadrado
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _removeSquare,
            ),
        ],
      ),
      body: GestureDetector(
        onPanStart: squareRect == null ? _onPanStart : _onDragSquareStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: squareRect == null ? _onPanEnd : _onDragSquareEnd,
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Cuadrado dibujado por el usuario
            if (squareRect != null)
              Positioned(
                left: squareRect!.left + currentDragOffset.dx,
                top: squareRect!.top + currentDragOffset.dy,
                child: Container(
                  width: squareRect!.width,
                  height: squareRect!.height,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
              ),
            // Texto centrado para instrucciones
            if (squareRect == null)
              Center(
                child: Text(
                  "Toca y arrastra para dibujar un cuadrado.\nArrástralo para moverlo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
