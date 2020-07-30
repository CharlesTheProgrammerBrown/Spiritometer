import 'dart:io';

import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:spiritometer/Services/auth.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';


class Profile extends StatefulWidget {
  final Future userName;
  Profile(name, {this.userName});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic defaultAvatar = 'https://via.placeholder.com/150';
 final AuthService _auth = AuthService();
  //File pathFiles;
  //bool fileAdded = false;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
//final userName = Provider.of<User>(context);

    var editProfilePic = GestureDetector(
      onTap: () {
        getImage();

        /*setState(
          () {
            _image.path.isNotEmpty ? fileAdded = true : fileAdded = false;
          },
        );*/
      },
      child: Container(
        height: 40,
        width: 30,
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.all(Border(10.0)),
            color: Colors.amberAccent,
            shape: BoxShape.circle),
        child: Icon(
          LineAwesomeIcons.pen,
          color: Colors.black,
          size: 20,
        ),
      ),
    );

    var profilePic =  Column(
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                OutlineGradientButton(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF59c173),
                      Color(0xFF8f94fb),
                      Color(0xFFa17fe0),
                    ],
                    begin: Alignment(-1, -1),
                    end: Alignment(2, 2),
                  ),
                  strokeWidth: 5,
                  padding: EdgeInsets.all(8),
                  radius: Radius.circular(70),
                  //Colors.deepPurpleAccent[400],
                  child: CircleAvatar(
                    radius: 64,
                    //height: 70,
                    backgroundImage: _image == null
                        ? NetworkImage(defaultAvatar)
                        : FileImage(_image),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: editProfilePic,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.userName.toString(),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          )
        ],
      );
    

    var navHeader = Row(
      children: <Widget>[
        BackButton(
          color: Colors.white,
        ),
      ],
    );

    var logOut = GestureDetector(
      onTap: () async {
        await _auth.signOut();
        await Navigator.popAndPushNamed(context, '/');
      },
      child: ProfileListItem(
        icon: LineAwesomeIcons.alternate_sign_out,
        text: 'Logout',
        hasNav: false,
      ),
    );

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: GestureDetector(
          
                onTap: () => FocusScope.of(context).unfocus(),
        
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:2.0),
                  child: navHeader,
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: FirebaseAuth.instance.currentUser(),
                  builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
                    if(snapshot.hasData){
                    return profilePic;
                  }
                  else{
                    return Text('Loading');
                  }
                   },
                    ),
                SizedBox(height: 10),
                      Container(

                       // color: Colors.blue,
                        height: MediaQuery.of(context).size.height*0.6,
                        child:ListView(
                          
                          children:[ 
                           SizedBox(height:30 ),
                            ProfileListItem(
                          icon: LineAwesomeIcons.user_edit,
                          text: 'Change User Profile Name',
                        ),
                      //SizedBox(height:10 ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_lock,
                        text: 'Change Password',
                      ),
                     // SizedBox(height:10 ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.bell,
                        text: 'Notifications',
                      ),
                     // SizedBox(height:10 ),
                      logOut,
              ],),),],
                  ),
                
                
              
            ),
          ),
        );
      
    
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNav;

  ProfileListItem({this.icon, this.text, this.hasNav = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      //width: 50,
      margin: EdgeInsets.symmetric(horizontal: 20).copyWith( top: 35),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFF59c173),
            Color(0xFF8f94fb),
            Color(0xFFa17fe0),
          ],
          begin: Alignment(-1, -1),
          end: Alignment(2, 2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            this.icon,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            this.text,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          if (this.hasNav)
            Icon(
              LineAwesomeIcons.angle_right,
              size: 25,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
