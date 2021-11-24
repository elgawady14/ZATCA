<div id="top"></div>
<div align="center"> 
  <a href="https://salla.dev"> 
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Swift_logo.svg/2560px-Swift_logo.svg.png" alt="Logo" width="896" height="277"> 
  </a>
  <h1 align="center">ZATCA (Fatoora) QR-Code Implementation in iOS</h1>
  <p align="center">
    An unofficial package to help iOS developers community to implement ZATCA (Fatoora) QR code easily which required for e-invoicing 
  </p>
  <p align="left">
    <a href="https://www.linkedin.com/in/ahmadabdulgawadmahmoud/">Report a Bug</a> 
  </p>
</div>

## Requirements
* `Xcode 13`
* `iOS 15`

## Installation

You can directly compile and run the code on `Xcode 13` IDE and for earlier Xcode versions `(< 13)` 

you can export `ZatcaQRCodeGenerator.swift` & `Extensions.swift` files into your project. 

## Usage

### 2 Steps

Step 1: Create an istance from `ZatcaQRCodeGenerator` class
```swift
    var qrCodegenerator = ZatcaQRCodeGenerator(tags: [
        ZatcaQRCodeTag(tag: .SellerNameTag, value: "Jawad"),               // {Seller name}
        ZatcaQRCodeTag(tag: .VatIdTag, value: "123456789"),                // {Seller TAX ID}
        ZatcaQRCodeTag(tag: .DateTimeTag, value: "2021-11-24T11:11:11Z"),  // {Invoice Date/Time}
        ZatcaQRCodeTag(tag: .InvoiceTotalWithVatTag, value: "100.00"),     // {Order Total Amount including VAT}
        ZatcaQRCodeTag(tag: .InvoiceVatTag, value: "15.00"),               // {Order VAT Amount}
    ])
```
Step 2: 
Generate the Base64 Encoded String or TLV (Tag Length Value) format or the QR Code Image in this way
```swift
qrCodegenerator.base64EncodedString!  
// Output AQVKYXdhZAIJMTIzNDU2Nzg5AxQyMDIxLTExLTI0VDExOjExOjExWgQGMTAwLjAwBQQxNS4w

qrCodegenerator.tlvs! 
// Output [1, 5, 74, 97, 119, 97, 100, 2, 9, 49, 50, 51, 52, 53, 54, 55, 56, 57, 3, 20, 50, 48, 50, 49, 45, 49, 49, 45, 50, 52, 84, 49, 49, 58, 49, 49, 58, 49, 49, 90, 4, 6, 49, 48, 48, 46, 48, 48, 5, 5, 49, 53, 46, 48, 48]

qrCodegenerator.qrCodeImage!
```
## How it works?

### 2 Steps

Step 1:  Create an array of `[UInt8]` data type to include the generated Tag Length Value list (`TLV`).
```swift
public var tlv: [UInt8] = []
```
Step 2:

For each type from the following `5` tag types:
- `Seller name`
- `Company VAT ID`
- `Invoice Date/Time`
- `Order total amount including VAT` 
- `Order VAT amout` 

We have to apply the following step:
1. Append the `.utf8` values for the following:
  - `tag` (`5` Static Values `1` or `2` or `3` or `4` or `5`).
  - `length` (Number of bytes for each `value`).
  -  `value` the values for the `5` tag types used in Step 1.
```swift
tlv = [UInt8(tag.rawValue)!, length] + [UInt8](value.utf8)
```
## TODO

**Insha'Allah**, I will continue work on this package until support the whole cycle of QR code implementation.

- [ ] Support the digital signature for the QR code.

## Support

Kindly send to me here [LinkedIn](https://www.linkedin.com/in/ahmadabdulgawadmahmoud/)


## Contributing

Contributions are what makes the open-source community such an amazing place to learn, inspire, and create. 
Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. 
You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

## Credits

- [Salla](https://github.com/sallaApp)
- [All Contributors](../../contributors)


## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

