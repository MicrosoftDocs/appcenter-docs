---
title: Automating Xamarin.Forms iOS DatePickers with Xamarin.UITest
description: How to automate datepickers
keywords: uitest test cloud
author: oddj0b
ms.author: vigimm
ms.reviewer: kegr
ms.date: 05/01/2020
ms.topic: article
ms.assetid: EBA22D3B-EB39-400E-8881-B78D621301D4
ms.service: vs-appcenter
ms.custom: test
---

# Automating Xamarin.Forms iOS DatePickers with Xamarin.UITest
Selecting values from DatePickers can be tricky in UITest. This issue is because the DatePicker control is an OS construct outside of your app’s UI interface. 

You can slightly nudge each control to trigger the label to update:

app.Query(x => x.Class("UIPickerView").Invoke("selectRow", date.Month - 1, "inComponent", 0, "animated", true)); 
app.Query(x => x.Class("UIPickerView").Invoke("selectRow", date.Day - 1, "inComponent", 1, "animated", true)); 
app.Query(x => x.Class("UIPickerView").Invoke("selectRow", date.Year - 1, "inComponent", 2, "animated", true));  

var rect = app.Query(x => x.Class("UIPickerTableView").Index(0).Child()).First().Rect; 
app.DragCoordinates(rect.CenterX, rect.CenterY, rect.CenterX, rect.CenterY + 20);  

rect = app.Query(x => x.Class("UIPickerTableView").Index(3).Child()).First().Rect; 
app.DragCoordinates(rect.CenterX, rect.CenterY, rect.CenterX, rect.CenterY + 20);  

rect = app.Query(x => x.Class("UIPickerTableView").Index(6).Child()).First().Rect; 
app.DragCoordinates(rect.CenterX, rect.CenterY, rect.CenterX, rect.CenterY + 20); 

app.Tap(c => c.Text("Done")); 