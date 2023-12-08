import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key:key);
  @override
  // ignore: library_private_types_in_public_api
  _MyRegisterState createState() => _MyRegisterState();
}
class _MyRegisterState extends State<MyRegister> {
  bool value = false;  
  int _value = 0; //initially no radio button will be selected


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image : AssetImage('assets/gdscnuml.png'), fit :BoxFit.cover)
      ),
      // by default scaffold puts background in white
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        backgroundColor: Colors.transparent,
        body: Stack (
          children: [
            Container(
              // to create gap between screen edge and the text fields or elements
              padding: const EdgeInsets.only(left:35, top:10),
              child: const Text('Join GDSC NUML!', style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                // till now the text is on left top side, so margin is needed
              ),),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.20, right:35, left:35),
              // we are using media query to get the height of the screen and then multiply it with 0.5 to get the middle of the screen
              child: 
              Column(
                /* Columns have two alignment method
                  -main access (top to bottom), -cross access */
                children: [
                TextField(
                  decoration: InputDecoration(
                    //set textbox to be not mixed in with the background(white)
                    fillColor: const Color.fromARGB(255, 198, 201, 202),
                    filled: true,
                    hintText: 'Name',
                    //fixing its left and right border, to prettify it
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    //set textbox to be not mixed in with the background(white)
                    fillColor: const Color.fromARGB(255, 198, 201, 202),
                    filled: true,
                    hintText: 'Email',
                    //fixing its left and right border, to prettify it
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                // to put some gap between the text fields
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  //password should not be visible so using following property
                  obscureText: true,
                  decoration: InputDecoration(
                    //set textbox to be not mixed in with the background(white)
                    fillColor: const Color.fromARGB(255, 198, 201, 202),
                    filled: true,
                    hintText: 'Password',
                    //fixing its left and right border, to prettify it
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Student?', style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w700,
                    color: Colors.blueGrey
                  ),
                    ),
                    Checkbox(
                      value: value,
                      onChanged: (value) => setState(() =>this.value = value!),
                      ),
                  ]
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children:[
                  Row(children: [
                    const Text('Gender: ', style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w700,
                    color: Colors.blueGrey
                  ),
                    ),
                    Radio( //radio logic is that both values will check if group == value
                      value: 1,
                      groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      },
                    ),
                   const SizedBox(width: 5.0,),
                   const Text('Female', style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w700,
                    color: Colors.blueGrey
                  ),
                    ),
                  ],),
                  const SizedBox(width: 5.0,),
                  Row(children: [
                    Radio( //radio logic is that both values will check if group == value
                      value: 2,
                      groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      },
                    ),
                   const SizedBox(width: 5.0,),
                   const Text('Male', style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w700,
                    color: Colors.blueGrey
                  ),
                    ),
                  ],)
                 ],
               ),
               
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  /* Rows have two alignment method
                  -main access (left - right), -cross access */
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Sign in', style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w700,
                    color: Colors.blueGrey
                  ),
                  ),
                  CircleAvatar( //user representation
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 165, 173, 196), //same as the font 
                    child: IconButton(
                       //picking a suitable arrow with forward arrow to signify moving next page
                      icon: Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 35,),
                      onPressed:null,
                    )
                  )
                ],
                ),
              ]),
              ),
          ]
        )
      ),
    );
  }

  void onChanged(bool? value) {
  }
}
