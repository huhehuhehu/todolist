import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/editor.dart';
import 'const.dart';
import 'quicky.dart';


class qTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _qTabState();
}

class _qTabState extends State<qTab> {

  // showAlertDialog(BuildContext context, int index) {
  //   // set up the buttons
  //   Widget cancelButton = FlatButton(
  //     child: Text("Cancel"),
  //     onPressed:  () {
  //       Navigator.pop(context);
  //     }
  //   );
  //   Widget continueButton = FlatButton(
  //     child: Text("Continue"),
  //     onPressed:  () async {
  //       todoHelper.deleteTask(ques[index].id).then((value) async{
  //         List<quicky> list = await todoHelper.getAllTask();
  //         ques = list;
  //         setState((){
  //           Navigator.pop(context);
  //         }
  //         );
  //       });
  //
  //     }
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Confirm Delete?"),
  //     content: Text("Can not be undone"),
  //     actions: [
  //       continueButton,
  //       cancelButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ques.length,
        itemBuilder: (BuildContext context, int index) {
          final item = ques[index].getTitle();
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editor.editing(index)),
              ).then((value) => setState(() {}));
            },
            child: Dismissible(
              dismissThresholds: {
                DismissDirection.startToEnd: .6,
                DismissDirection.endToStart: 1.00,
              },
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  todoHelper.deleteTask(ques[index].id).then((value) async{
                    List<quicky> list = await todoHelper.getAllTask();
                    ques = list;
                    setState(() {
                    });
                  });
                };
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: AlignmentDirectional.centerStart,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.white,
              ),
              key: Key(item),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editor()),
          ).then((value) => setState(() {}));
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}
