import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class AirtimeConvert extends StatefulWidget {
  const AirtimeConvert({required Key key}) : super(key: key);
  @override
  AirtimeConvertState createState() => AirtimeConvertState();
}

class AirtimeConvertState extends State<AirtimeConvert> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _confirmPhoneNumberController = TextEditingController();
  final _amountController = TextEditingController();
  String _phoneNumber = 'N/A';
  String _amount = '# 0.00';
  String _transactionFee = 'N/A';
  String _total = '# 0.00';
  final _phoneNumberFocusNode = FocusNode();
  final _confirmPhoneNumberFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _confirmPhoneNumberController.dispose();
    _amountController.dispose();
    _phoneNumberFocusNode.dispose();
    _confirmPhoneNumberFocusNode.dispose();
    _amountFocusNode.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Airtime to Cash'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    hintText: "Sender's Phone Number",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ),
                  
                  //keyboardType: TextInputType.number,
                    /*inputFormatters:  <TextInputFormatter> [
                        FilteringTextInputFormatter.allow(RegExp(r"^\+?0[0-9]{10}$")),
                        FilteringTextInputFormatter.digitsOnly,                          
                        ],*/
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_confirmPhoneNumberFocusNode);
                  },
                  focusNode: _phoneNumberFocusNode
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _confirmPhoneNumberController,
                  decoration: const InputDecoration(
                    hintText: "Confirm Sender's Phone Number",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ), 
                  
                  //keyboardType: TextInputType.number,
                    /*inputFormatters:  <TextInputFormatter> [
                        FilteringTextInputFormatter.allow(RegExp(r"^\+?0[0-9]{10}$")),
                        FilteringTextInputFormatter.digitsOnly,                          
                        ],*/
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "This field is required";
                    }
                    if (value != _phoneNumberController.text) {
                      return "Phone numbers doesn't match";
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_amountFocusNode);
                  },
                  focusNode: _confirmPhoneNumberFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Colors.red,
                        width: 2.0,
                      ),
                    ),
                  ), 
                  
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                        _amount = '# $value';
                        _transactionFee = '# ${getTransactionFee(double.parse(value))}';
                        _total = '# ${getTotal(double.parse(value), getTransactionFee(double.parse(value)))}';
                      });
                  }, 
                  focusNode: _amountFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Overview',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const  Text(
                              'Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_amount),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sender's Phone Number",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_phoneNumber),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Transaction fee',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_transactionFee),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_total),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hi Chief!'),
                          content: const Text('Your airtime conversion has been proccessed'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    } 
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getTransactionFee(double amount){
    return amount * (10/100);
  }
  double getTotal(double amount, double transactionFee){
    return amount + transactionFee;
  }
  

}