import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/quicky.dart';

import 'const.dart';

bool editing = false;
int index = 0;

class editor extends StatefulWidget{

  editor(){
    editing = false;
  }

  editor.editing(int i){
    index = i;
    editing = true;
  }

  @override
  State<StatefulWidget> createState() => _editorState();
}

class _editorState extends State<editor>{

  static final myController = TextEditingController();

  TextField tf = TextField(
    maxLines: 99999,
    // autofocus: true,
    controller: (!editing) ? myController : (myController..text = ques[index].content),
  );


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        myController.clear();
        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("New quicknote"),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: IconButton(
                  icon: Icon(Icons.save),
                onPressed: () async{
                  if (!editing) {
                    currentQ = quicky(content: myController.text);
                    todoHelper.insertTask(currentQ);
                  }else{
                    todoHelper.editTask(index,myController.text);
                  }
                  List<quicky> list = await todoHelper.getAllTask();
                    setState(() {
                      ques = list;
                      myController.clear();

                      Navigator.pop(context);
                    });
                }),
            )
          ],
        ),
        body: Container(
          color: Colors.black12,
          height: double.infinity,
          child: tf,
        ),
        resizeToAvoidBottomPadding: true,
      ),
    );
  }
}

