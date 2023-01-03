

import 'dart:convert';
import 'dart:io';

dynamic config;

void initAppData(){
  File configFile = File(".config/app-config.json");
  config = jsonDecode(configFile.readAsStringSync());
} 


