import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
import "."
Window {
 width: 360
 height: 640
 visible: true
 title: qsTr("StackView_test")

 property int defMargin:10

 StackView{
     id:stack_view
     anchors.fill: parent
     initialItem: page1
 }

 My_Page
 {
 id:page1
 backgroundColor: "red"
 button1Text: "To_Green"
 button2Text: "To_Yellow"
 button3Text: "Forward"
 onButton3Clicked: {
 stack_view.pop()
 }
 onButton1Clicked: {
 stack_view.pop()
 stack_view.replace(page1)
 stack_view.push(page3)
 }
 onButton2Clicked: {
     stack_view.pop()
     stack_view.replace(page1)
     stack_view.push(page2)
 }
 }

 My_Page
 {
 id:page2
 backgroundColor: "yellow"
 button1Text: "To_Red"
 button2Text: "To_Green"
 button3Text: "Forward"
 onButton3Clicked: {
 stack_view.pop()
 }
 onButton1Clicked:
 {
 stack_view.pop()
 stack_view.replace(page2)
 stack_view.push(page1)
 }
 onButton2Clicked: {
 stack_view.pop()
 stack_view.replace(page2)
 stack_view.push(page3)
 }
 }

 My_Page
 {
 id:page3
 backgroundColor: "green"
 button1Text: "To_Yellow"
 button2Text: "To_Red"
 button3Text: "Forward"
 onButton3Clicked: {
 stack_view.pop()
 }
 onButton1Clicked: {
 stack_view.pop()
 stack_view.replace(page3)
 stack_view.push(page2)
 }
 onButton2Clicked: {
 stack_view.pop()
 stack_view.replace(page3)
 stack_view.push(page1)
 }
 }
}
