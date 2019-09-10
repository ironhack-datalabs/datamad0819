from fpdf import FPDF

class PDF(FPDF):


    
    
    
    def input_title(self,title="Analisis de comida pedida en EUUU"):
        self.add_page()
        self.set_font('Arial', 'B', 16)
        self.cell(200, 10, title,align = 'C')
        self.ln()
        self.ln()

    def input_subtitle(self,title):
        self.set_font('Arial', 'B', 14)
        self.cell(200, 10, title,align = 'L')

    def input_line(self,line):
        self.ln()
        self.set_font('Arial', '', 10)
        self.cell(10, 10, line)
