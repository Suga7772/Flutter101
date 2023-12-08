import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});
  @override
  State<MyLogin> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyLogin> {

  @override
  Widget build(BuildContext context) {
    /* we are returning container as it will add background image
      in the case of scaffold, it has a limitation to only edit background color*/
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image : AssetImage('assets/gdsclogobottom.png'), fit :BoxFit.cover)
      ),
      // by default scaffold puts background in white
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack (
          children: [
            Container(
              // to create gap between screen edge and the text fields or elements
              padding: const EdgeInsets.only(left:35, top:80),
              child: const Text('Welcome to\n GDSC', style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                // till now the text is on left top side, so margin is needed
              ),),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.40, right:35, left:35),
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
                    hintText: 'Email',
                    //fixing its left and right border, to prettify it
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
        
                // to put some gap between the text fields
                const SizedBox(
                  height: 30,
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
                  height: 24,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'register');
                    }, 
                    child: const Text('No GDSC? Register!', style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize:  20,
                      color: Colors.redAccent,
                    ),)),
                    const TextButton(onPressed: null, child: Text('Forgot \nPassword?', style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize:  20,
                      color: Colors.blueAccent,
                    ),))
                    
                  ]
                ),
              ]),
              ),
          ]
        )
      ),
    );
  }
}