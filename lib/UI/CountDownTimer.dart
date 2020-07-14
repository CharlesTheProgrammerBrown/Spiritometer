import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';


class CountDownTimer extends StatefulWidget {
  final chosenTime;
  final path;
  CountDownTimer(this.chosenTime, this.path);

  

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {

//btn variables
  String txt="Play";
  bool btnPlay = false;  
  
//animation controller - button and container fill
  AnimationController controller;
  AnimationController btnController;
  String get timerString 
  {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

//audio varibales
bool isPlaying = false;
AudioPlayer audioPlayer;
 


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: 1,
      vsync: this,
      duration: Duration(seconds: widget.chosenTime),
    );

    btnController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    audioPlayer = AudioPlayer();
  }

//debug for audio
final String error =   'Error occurred in playing from storage';
final String success = 'Process Success';



playAudioFromLocalStorage(path) async {
    int response = await audioPlayer.play(path, isLocal: true);

    response == 1 ? print('$success') : print('$error');
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    response == 1 ? print('$success -pause') : print('$error -in pause');
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();
    response == 1 ? print('$success -resume') : print('$error -in resume');
  }

  stopAudio() async {
    int response = await audioPlayer.stop();
    response == 1
        ? print('$success -stopped music')
        : print('$error -in stopping');
  }


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
        iconTheme: IconThemeData(color: Colors.white), accentColor: Colors.red);
    return Scaffold(
      backgroundColor: Colors.white10,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.blue,
                    height:
                        controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: Colors.white,
                                    color: themeData.indicatorColor,
                                  )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Count Down Timer",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        ),
                      ),
                       FloatingActionButton.extended(
                                  //color: Colors.white,
                                  //iconSize: 70,
                                  icon: AnimatedIcon(
                                      icon: AnimatedIcons.play_pause,
                                      progress: btnController),
                                  onPressed: () {
                                     isPlaying =!isPlaying;
                                    isPlaying? playAudioFromLocalStorage(widget.path):pauseAudio();
        
                                       btnPlay =!btnPlay;
                                       btnPlay? btnController.forward() :btnController.reverse();
                                     
                                   
                                     
                                    if (controller.isAnimating) {
                                      controller.stop();
                                      setState(() {
                                        //txt ="PLAY";
                                      });
                                      
                                      //btnController.forward();
                                    } else 
                                    if(!controller.isAnimating){
                                      controller.reverse(
                                          from: controller.value == 0.0
                                              ? 1.0
                                              : controller.value);
                                              setState(() {
                                                txt="PAUSE";
                                              });
                                              
                                      //btnController.reverse();

                                      if(controller.isCompleted){
                                        stopAudio();

                                      }
                                    }
                                  },
                                   label: Text(txt),
                                    
                                ),
                      /*AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {
                                  if (controller.isAnimating)
                                    controller.stop();
                                  else {
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                  }
                                },
                                icon: AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: controller),
                                label: Text(
                                    controller.isAnimating ? "Pause" : "Play"));
                          }),*/
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

 
}

 

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

//override our paint method
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

//arc to move when circle painted
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

