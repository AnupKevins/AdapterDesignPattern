// Legacy Printer with outdated interface
class LegacyPrinter {
    func printDocumentOldWay() -> String {
        return "Legacy Printer: Printing document (old way)"
    }
}

// Modern Printing Interface expected by the new system
protocol ModernPrinting {
    func printDocumentNewWay() -> String
}

// Adapter to bridge the gap between LegacyPrinter and ModernPrinting
class PrinterAdapter: ModernPrinting {
    let legacyPrinter: LegacyPrinter

    init(legacyPrinter: LegacyPrinter) {
        self.legacyPrinter = legacyPrinter
    }

    func printDocumentNewWay() -> String {
        // Adapt the old method to conform to the new interface
      return legacyPrinter.printDocumentOldWay()
    }
}

// New system that expects printers to conform to ModernPrinting
class NewPrintingSystem {
    func printUsingModernInterface(printer: ModernPrinting) -> String {
       return printer.printDocumentNewWay()
    }
}

// Usage in the new system
let legacyPrinter = LegacyPrinter()
legacyPrinter.printDocumentOldWay()
let adapter = PrinterAdapter(legacyPrinter: legacyPrinter)

let newPrintingSystem = NewPrintingSystem()
newPrintingSystem.printUsingModernInterface(printer: adapter)

