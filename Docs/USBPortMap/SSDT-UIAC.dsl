DefinitionBlock ("", "SSDT", 2, "ACDT", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            // XHC (1022_149c)
            "1022_149c", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PRT2", Package()
                      {
                          "name", Buffer() { "PRT2" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Front 2.0" },
                      },
                      "PRT8", Package()
                      {
                          "name", Buffer() { "PRT8" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Front 3.2" },
                      },
                },
            },
            // XHCI (1022_149c)
            "1022_149c", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PRT1", Package()
                      {
                          "name", Buffer() { "PRT1" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackRightDOWN 2.0" },
                      },
                      "PRT2", Package()
                      {
                          "name", Buffer() { "PRT2" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BACKRightUP 2.0" },
                      },
                      "PRT6", Package()
                      {
                          "name", Buffer() { "PRT6" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackLeftDOWN 2.0" },
                      },
                      "PRT7", Package()
                      {
                          "name", Buffer() { "PRT7" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackRightDOWN 3.2" },
                      },
                      "PRT8", Package()
                      {
                          "name", Buffer() { "PRT8" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackRightUP 3.2" },
                      },
                },
            },
            // XHC2 (1022_149c)
            "XHC2", Package()
            {
                "port-count", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "PRT1", Package()
                      {
                          "name", Buffer() { "PRT1" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterUPtoC 2.0" },
                      },
                      "PRT2", Package()
                      {
                          "name", Buffer() { "PRT2" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterTypeC 2.0" },
                      },
                      "PRT3", Package()
                      {
                          "name", Buffer() { "PRT3" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterDOWN 2.0" },
                      },
                      "PRT4", Package()
                      {
                          "name", Buffer() { "PRT4" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterUP 2.0" },
                      },
                      "PRT5", Package()
                      {
                          "name", Buffer() { "PRT5" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterTypeC 3.2" },
                      },
                      "PRT6", Package()
                      {
                          "name", Buffer() { "PRT6" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterUPtoC 3.2" },
                      },
                      "PRT7", Package()
                      {
                          "name", Buffer() { "PRT7" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterDOWN 3.2" },
                      },
                      "PRT8", Package()
                      {
                          "name", Buffer() { "PRT8" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "BackCenterDOWN 3.2" },
                      },
                },
            },
        })
    }
}
