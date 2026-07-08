;;; pages/index.scm --- landing page content

(define-module (pages index)
  #:use-module (haunt page)
  #:use-module (haunt html)
  #:use-module (templates default)
  #:export (index-page))

;;; Helpers ----------------------------------------------------------

(define* (condition-card icon title text evidence #:optional subtitle)
  `(div (@ (class "condition-card"))
     (div (@ (class "condition-card-inner"))
       (i (@ (class ,(string-append icon " condition-icon"))))
       (div
         (h3 (@ (class "condition-title")) ,title)
         ,@(if subtitle
               `((p (@ (class "condition-subtitle")) ,subtitle))
               '())
         (p (@ (class "condition-text")) ,text)
         (p (@ (class "condition-evidence")) ,evidence)))))

(define (process-card step title text)
  `(div (@ (class "process-card"))
     (span (@ (class "process-step")) ,step)
     (h4 (@ (class "process-card-title")) ,title)
     (p (@ (class "process-card-text")) ,text)))

(define* (highlight-item text #:optional (wide? #f))
  `(div (@ (class ,(if wide? "highlight-item highlight-item-wide" "highlight-item")))
     (i (@ (class "fas fa-check-circle highlight-icon")))
     ,text))

(define (tag text)
  `(span (@ (class "tag")) ,text))

(define* (evidence-card number label #:optional source)
  `(div (@ (class "evidence-card"))
     (div (@ (class "evidence-number")) ,number)
     (div (@ (class "evidence-label"))
       ,label
       ,@(if source
             `((span (@ (class "evidence-source")) ,source))
             '()))))

;;; Sections ---------------------------------------------------------

;;; Botão do WhatsApp

(define (whatsapp-btn)
  ;; 🚀 Botão Flutuante do WhatsApp Fixo (Persiste na rolagem)
  `(a (@ (class "fixed bottom-6 right-6 z-50 flex items-center justify-center w-14 h-14 rounded-full bg-[#25D366] text-white text-2xl shadow-xl hover:bg-emerald-600 hover:scale-110 transition-all duration-200")
        (href "https://wa.me/5585997491882")
        (target "_blank")
        (title "Agendar Consulta via WhatsApp"))
     (i (@ (class "fab fa-whatsapp")))))

;;; Início (Hero)

(define (hero-section)
  `(section (@ (id "inicio") (class "relative min-h-screen flex py-16 md:py-20 bg-med-green overflow-hidden"))          
            ;; 🎨 Grafismo Ajustado: Visível no mobile (com escala menor) e ampliado no desktop (md:)
            (img (@ (class "absolute bottom-[5%] right-[-10%] scale-150 opacity-10 brightness-0 invert md:bottom-[10%] md:right-[10%] md:scale-[250%]") 
                    (src "assets/img/grafismo.svg")))
            
            (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl flex items-center"))
                 (div (@ (class "flex-1 z-10 w-full"))
                      (h1 (@ (class "font-serif text-4xl md:text-5xl font-bold text-white/95 leading-tight tracking-tight max-w-3xl border-b-2 border-med-gold pb-3")) 
                          "Saúde que vai à raiz.")
                      (p (@ (class "text-base md:text-lg text-white/90 max-w-2xl mt-4 leading-relaxed"))
                         "Consultas médicas especializadas em Cannabis medicinal com abordagem integrativa, preventiva e promotora de " 
                         (i "Qualidade de Vida.") " Ciência séria. Cuidado humano.")
                      (ul (@ (class "list-none p-0 flex flex-col sm:flex-row flex-wrap gap-4 mt-8"))
                          (li (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-bold py-3.5 px-6 rounded-full bg-[#25D366] text-white shadow-md hover:bg-med-green-light transition ease-in-out duration-150") 
                                    (href "https://wa.me/5585997491882"))
                                 (i (@ (class "fab fa-whatsapp text-xl"))) " Agendar consulta pelo WhatsApp"))
                          (li (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-medium py-3.5 px-6 rounded-full bg-med-bg text-med-green border border-med-green/20 shadow-sm hover:bg-white transition ease-in-out duration-150") 
                                    (href "#area-atuacao")) 
                                 "Saiba Mais sobre o Tratamento")))))))
        
;;; Área de Atuação

(define (acting-section)
  `(section (@ (id "area-atuacao") (class "min-h-screen flex py-16 md:py-20 bg-[#C8A035]"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl flex items-center"))
            (div (@ (class "w-full"))
              (h2 (@ (class "font-serif text-2xl md:text-4xl font-bold mt-4 leading-tight")) "O corpo tem um sistema próprio de equilíbrio. " (br (@ (class "hidden md:inline"))) " A Cannabis medicinal sabe falar com ele.")
              (p (@ (class "text-base md:text-lg max-w-3xl mt-4 leading-relaxed"))
                 "O Sistema Endocanabinoide humano regula o sono, a dor, o humor, a imunidade e a inflamação. Quando esse sistema está desequilibrado, surgem sintomas que muitas vezes resistem aos tratamentos convencionais. A Cannabis medicinal age diretamente nesse sistema — com crescente respaldo científico e prescrição médica individualizada.")
              (ul (@ (class "list-none p-0 flex flex-col sm:flex-row flex-wrap gap-4 mt-8"))
                (li (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-medium py-3.5 px-6 rounded-full bg-[#1b3a2f] text-white shadow-md hover:bg-[#2f5443] transition ease-in-out duration-150") (href "#condicoes-tratadas")) "Ver condições tratadas "))
                (li (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-medium py-3.5 px-6 rounded-full bg-[#F0EBE0] text-[#1b3a2f] border border-[#1b3a2f]/20 shadow-sm hover:bg-white transition ease-in-out duration-150") (href "#sobre-o-processo")) "Saiba mais sobre o processo ")))))))

;;; Condições Tratadas

(define (conditions-section)
  `(section (@ (id "condicoes-tratadas") (class "py-16 md:py-20"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl"))
            (div (@ (class "grid grid-cols-1 md:grid-cols-2 gap-6 w-full"))
              
              ;; Card 1
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-brain text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Doenças Neurodegenerativas")
                    (p (@ (class "text-xs md:text-sm font-medium text-[#4b5563] mt-1")) "Alzheimer, Parkinson, Esclerose Lateral Amiotrófica (ELA)")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Os canabinóides têm ação neuroprotetora, anti-inflamatória e antioxidante comprovada em estudos clínicos. Auxiliam no controle de sintomas motores, agitação, distúrbios de sono e qualidade de vida de pacientes e cuidadores.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: estudos em modelos de Alzheimer mostram redução de placas amiloides e neuroinflamação com uso de CBD e THC combinados."))))
              
              ;; Card 2
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-puzzle-piece text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Neurodiversidade")
                    (p (@ (class "text-xs md:text-sm font-medium text-[#4b5563] mt-1")) "Autismo (TEA) e TDAH")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Pesquisas israelenses e brasileiras apontam melhora significativa em irritabilidade, hiperatividade, ansiedade associada e qualidade do sono em crianças e adultos com TEA. No TDAH, a modulação dopaminérgica via canabinóides tem se mostrado promissora como adjuvante terapêutico.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: estudo publicado no Journal of Autism and Developmental Disorders (2019) relatou melhora em 80% dos pacientes com TEA tratados com CBD."))))

              ;; Card 3
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-bolt text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Epilepsia Refratária")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Uma das indicações com maior respaldo científico disponível. O CBD foi o primeiro canabinóide a receber aprovação do FDA (EUA) para o tratamento de epilepsia — especificamente as síndromes de Dravet e Lennox-Gastaut. Estudos clínicos de fase III demonstraram redução de até 50% na frequência de crises.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: New England Journal of Medicine, 2018 — ensaio clínico randomizado controlado por placebo."))))

              ;; Card 4
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-heart text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Transtornos de Ansiedade e Depressão")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "O CBD atua nos receptores serotoninérgicos e no eixo HPA (estresse), com efeito ansiolítico demonstrado em estudos clínicos. O THC em baixas doses também tem papel na regulação do humor. Uma alternativa ou complemento para quem busca menos dependência de benzodiazepínicos e antidepressivos convencionais.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: revisão publicada no Neurotherapeutics (2015) confirma eficácia do CBD para múltiplos transtornos de ansiedade."))))

              ;; Card 5
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-fire text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Dores Crônicas e Fibromialgia")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Canabinóides atuam nos receptores CB1 e CB2 do sistema nervoso central e periférico, modulando a percepção de dor e a inflamação sistêmica. Para pacientes com fibromialgia, dor neuropática, artrite reumatoide e dor oncológica, a cannabis medicinal representa uma alternativa eficaz com menor perfil de efeitos colaterais que opioides em uso prolongado.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: meta-análise publicada no JAMA (2015) — evidência moderada para dor crônica em adultos."))))

              ;; Card 6
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-moon text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Distúrbios do Sono")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Insônia, sono fragmentado, apneia e ansiedade noturna. O CBD em doses moduladas demonstra melhora na arquitetura do sono — especialmente nas fases de sono profundo — sem o risco de dependência gerado por sedativos convencionais. O CBN (outro canabinóide) também apresenta potencial sedativo relevante.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: Permanente Journal (2019) — 66,7% dos pacientes relataram melhora do sono no primeiro mês."))))

              ;; Card 7
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-ribbon text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Suporte Oncológico")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Reconhecida pela OMS e por diversas sociedades de oncologia como terapia de suporte, a cannabis medicinal auxilia no controle de náuseas e vômitos durante a quimioterapia, redução de dor, melhora do apetite e da qualidade de vida geral. Não substitui o tratamento oncológico, mas o humaniza.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: dois canabinóides sintéticos (Dronabinol e Nabilona) já são aprovados pelo FDA como antiéméticos oncológicos."))))

              ;; Card 8
              (div (@ (class "bg-[#f8faf9]/60 border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm"))
                (div (@ (class "flex flex-col sm:flex-row items-start gap-3"))
                  (i (@ (class "fas fa-seedling text-xl md:text-2xl text-[#1b3a2f] mt-1")))
                  (div
                    (h3 (@ (class "font-serif font-bold text-[#1b3a2f] text-lg")) "Cannabis Preventiva (40+)")
                    (p (@ (class "text-xs md:text-sm font-medium text-[#4b5563] mt-1")) "Síndrome de Deficiência do Sistema Endocanabinoide")
                    (p (@ (class "text-[#4b5563] text-sm mt-2 leading-relaxed")) "Após os 40 anos, o sistema endocanabinoide tende a perder tônus. A modulação preventiva com canabinóides pode apoiar o envelhecimento saudável — reduzindo inflamação sistêmica crônica de baixo grau, fortalecendo a imunidade, equilibrando hormônios e promovendo longevidade com qualidade. Cannabis como medicina preventiva, não só reativa.")
                    (p (@ (class "text-xs text-[#9ca3af] mt-2 italic")) "Evidência: conceito de Deficiência Clínica do SEC descrito por Ethan Russo, Neuroendocrinology Letters (2008)."))))))))

;;; O Processo

(define (process-section)
  `(section (@ (id "sobre-o-processo") (class "py-16 md:py-20"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl"))
            (div (@ (class "w-full"))        
              (h2 (@ (class "font-serif text-2xl md:text-3xl font-bold mt-4")) "Da dúvida à prescrição: um caminho seguro e individualizado.")
              (p (@ (class "mt-2 leading-relaxed text-[#4b5563]")) "A prescrição de Cannabis medicinal no Brasil é legal, regulamentada pela ANVISA desde 2019 e exige acompanhamento médico. Não existe protocolo universal — cada paciente recebe uma indicação personalizada de produto, concentração e posologia.")
              
              ;; Grid do processo: 1 coluna no mobile, 2 em tablets e 4 em desktop
              (div (@ (class "grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-5 mt-8"))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm")) (span (@ (class "inline-block bg-[#1b3a2f]/10 text-[#1b3a2f] font-bold text-xs py-1 px-3 rounded-full")) "Passo 1") (h4 (@ (class "text-[#1b3a2f] font-bold mt-3")) "Agendamento") (p (@ (class "text-sm text-[#4b5563] mt-2")) "Atendimentos presenciais em Fortaleza e Cascavel (CE). Ou atendimentos online via videochamada."))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm")) (span (@ (class "inline-block bg-[#1b3a2f]/10 text-[#1b3a2f] font-bold text-xs py-1 px-3 rounded-full")) "Passo 2") (h4 (@ (class "text-[#1b3a2f] font-bold mt-3")) "Anamnese Completa") (p (@ (class "text-sm text-[#4b5563] mt-2")) "Consulta detalhada com histórico clínico, medicações em uso, exames, estilo de vida e objetivos terapêuticos. O Dr. Marco escuta antes de prescrever."))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm")) (span (@ (class "inline-block bg-[#1b3a2f]/10 text-[#1b3a2f] font-bold text-xs py-1 px-3 rounded-full")) "Passo 3") (h4 (@ (class "text-[#1b3a2f] font-bold mt-3")) "Prescrição Individualizada") (p (@ (class "text-sm text-[#4b5563] mt-2")) "Indicação do produto canabinóide adequado ao seu caso: tipo de canabinóide (CBD, THC, full spectrum), concentração, forma farmacêutica e posologia."))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm")) (span (@ (class "inline-block bg-[#1b3a2f]/10 text-[#1b3a2f] font-bold text-xs py-1 px-3 rounded-full")) "Passo 4") (h4 (@ (class "text-[#1b3a2f] font-bold mt-3")) "Acompanhamento Continuado") (p (@ (class "text-sm text-[#4b5563] mt-2")) "Retornos periódicos para ajuste de dosagem, avaliação de resultados e adequação do tratamento à sua evolução clínica.")))
              
              (div (@ (class "mt-6 bg-[#1b3a2f]/5 border border-[#1b3a2f]/20 rounded-2xl p-5 md:p-6"))
                (div (@ (class "grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm text-[#374151]"))
                  (div (@ (class "flex items-start")) (i (@ (class "fas fa-check-circle text-green-700 mr-2 mt-0.5"))) "Receituário de controle especial conforme RDC 660/2022")
                  (div (@ (class "flex items-start")) (i (@ (class "fas fa-check-circle text-green-700 mr-2 mt-0.5"))) "Dosagem individualizada — não existe \"receita padrão\"")
                  (div (@ (class "flex items-start")) (i (@ (class "fas fa-check-circle text-green-700 mr-2 mt-0.5"))) "Sigilo e ética médica garantidos em todo o processo")
                  (div (@ (class "col-span-1 sm:col-span-2 flex items-start")) (i (@ (class "fas fa-check-circle text-green-700 mr-2 mt-0.5"))) "Atendimento presencial em Fortaleza e Cascavel (CE)")
                  (div (@ (class "col-span-1 sm:col-span-2 flex items-start")) (i (@ (class "fas fa-check-circle text-green-700 mr-2 mt-0.5"))) "Atendimento online via videochamada")))
              (ul (@ (class "list-none p-0 flex flex-wrap mt-8"))
                (li (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-medium py-3.5 px-6 rounded-full bg-[#1b3a2f] text-white shadow-md hover:bg-[#2f5443] transition ease-in-out duration-150") (href "#o-medico")) "Saiba mais sobre o médico ")))))))

;;; Sobre o Médico

(define (doctor-section)
  `(section (@ (id "o-medico") (class "py-16 md:py-20"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl"))
            (div (@ (class "w-full"))
              ;; 🔄 Mudança aqui: flex-col-reverse faz a imagem (que está embaixo no código) subir no mobile
              (div (@ (class "flex flex-col-reverse md:flex-row gap-8 items-center"))
                
                ;; Bloco de Texto
                (div (@ (class "w-full md:w-1/2"))
                  (h2 (@ (class "font-serif text-2xl md:text-3xl font-bold mt-4 text-[#1b3a2f]")) "Uma vida inteira dedicada à saúde integral.")
                  (div (@ (class "relative bg-[#f8faf9]/70 border border-[#d8e0da]/30 rounded-2xl p-5 mt-4"))
                    (div (@ (class "text-5xl font-serif text-[#1b3a2f]/15 leading-[0.5] m-0")) "“")
                    (p (@ (class "font-serif italic text-[#1b3a2f] font-medium text-sm md:text-base m-0 leading-relaxed")) "Minha atuação clínica é focada na saúde integral, preventiva e promotora de qualidade de vida.")
                    (p (@ (class "text-sm text-[#1b3a2f]/80 mt-2 font-semibold")) "— Dr. Marco Antônio Machado"))
                  (div (@ (class "mt-6 space-y-4 text-stone-700 text-sm md:text-base leading-relaxed"))
                    (p "Marco Antônio Machado, nascido em 2 de Dezembro de 1960, é médico formado pela Universidade Federal do Ceará (UFC). É concursado no município de Cascavel (CE), onde trabalha há mais de 20 anos na Atenção Primária à Saúde.")
                    (p "Sua atuação clínica sempre foi orientada pela saúde integral — não pelo sintoma isolado, mas pelo ser humano como um todo (Visão Sistêmica da Vida).")
                    (p "Há mais de 5 anos, é um dos médicos pioneers na prescrição de Cannabis medicinal no Ceará, e testemunha diária das transformações na vida de crianças com autismo à idosos com Alzheimer e Parkinson — experiências que aprofundaram sua convicção sobre o potencial terapêutico dos canabinóides quando prescritos com responsabilidade e ciência.")
                    (p "Além de médico, é avô de 12 netos e agroflorestador na Pachamama. Gosta de plantar árvores, água, ar e sonhos."))
                  (div (@ (class "flex flex-wrap gap-2 mt-6"))
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Medicina Integrativa")
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Cannabis Medicinal")
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Saúde Preventiva")
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Neurologia Funcional")
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Atenção Primária")
                    (span (@ (class "bg-[#1b3a2f]/10 text-[#1b3a2f] text-xs md:text-sm py-1.5 px-3 rounded-full")) "Longevidade")))
                
                ;; Bloco da Imagem (Agora com mb-6 para dar respiro no mobile)
                (div (@ (class "w-full md:w-1/2 flex justify-center mb-6 md:mb-0"))
                  (img (@ (class "rounded-2xl max-w-full h-auto max-h-[400px] md:max-h-[650px] object-cover shadow-md") (src "https://placehold.co/500x750?text=Fotografia")))))))))

;;; Evidências

(define (evidence-section)
  `(section (@ (id "evidencias") (class "py-16 md:py-20"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl"))
            (div (@ (class "w-full"))
              (h2 (@ (class "font-serif text-2xl md:text-3xl font-bold mt-4 text-[#1b3a2f]")) "Não é alternativo. É medicina com evidência.")
              
              ;; Grid corrigido: Substituído o flex-wrap com cálculos manuais por um CSS Grid nativo e muito mais fluido
              (div (@ (class "grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 mt-8"))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "870.000+")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "Pacientes com autorização para Cannabis medicinal no Brasil" 
                       (span (@ (class "block text-xs text-[#9ca3af] mt-1 font-medium")) "ANVISA · 2024")))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "50%")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "Redução de crises em epilepsia refratária com CBD" 
                       (span (@ (class "block text-xs text-[#9ca3af] mt-1 font-medium")) "New England Journal of Medicine · 2018")))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "30+")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "Países com cannabis medicinal regulamentada" 
                       (span (@ (class "block text-xs text-[#9ca3af] mt-1 font-medium")) "EUA, Canadá, Alemanha, Israel...")))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "1992")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "Descoberta do sistema endocanabinoide humano por Raphael Mechoulam" 
                       (span (@ (class "block text-xs text-[#9ca3af] mt-1 font-medium")) "A base científica que mudou a medicina")))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "2018")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "Aprovação do primeiro medicamento canabinóide pelo FDA para epilepsia" 
                       (span (@ (class "block text-xs text-[#9ca3af] mt-1 font-medium")) "Epidiolex — CBD puro")))
                (div (@ (class "bg-white border border-[#d8e0da]/30 rounded-2xl p-5 md:p-6 shadow-sm flex flex-col justify-between"))
                  (div (@ (class "text-2xl md:text-3xl font-bold text-[#1b3a2f]")) "5 anos")
                  (div (@ (class "text-xs md:text-sm text-[#4b5563] mt-2")) "De experiência clínica do Dr. Marco com Cannabis medicinal no Ceará")))
              
              (ul (@ (class "list-none p-0 flex flex-wrap gap-4 mt-8"))
                (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-2 font-medium py-3.5 px-6 rounded-full bg-[#1b3a2f] text-white shadow-md hover:bg-[#2f5443] transition ease-in-out duration-150") (href "#agende-sua-consulta")) "Agende sua Consulta"))))))

;;; CTA: Agende sua Consulta!

(define (cta-section)
  `(section (@ (id "agende-sua-consulta") (class "min-h-[85vh] flex py-16 md:py-20 bg-[#1b3a2f] text-center items-center text-white"))
          (div (@ (class "container mx-auto px-4 md:px-5 max-w-5xl flex items-center justify-center w-full"))
            (div (@ (class "w-full max-w-3xl"))
              (h1 (@ (class "font-serif text-3xl md:text-4xl font-bold")) "O primeiro passo é uma conversa.")
              (img (@ (class "mx-auto my-6 max-w-[150px] md:max-w-none opacity-30 brightness-0 invert") (src "assets/img/separador.svg")))
              (p (@ (class "text-sm md:text-base leading-relaxed mb-8 max-w-2xl mx-auto")) "Uma consulta com o Dr. Marco é mais do que uma prescrição. É o início de um cuidado médico que vê você como um todo — sua história, seu corpo, sua vida. Vagas limitadas. Atendimentos presenciais em Fortaleza e Cascavel (CE). Ou atendimentos online via videochamada.")
              
              ;; Botão principal de CTA: Ajustado para crescer proporcionalmente no desktop sem causar quebras em telas pequenas
              (div (@ (class "my-8 md:my-12"))
                (a (@ (class "w-full sm:w-auto inline-flex items-center justify-center gap-3 font-bold py-4 px-8 rounded-full bg-white text-[#1b3a2f] shadow-xl hover:bg-gray-100 text-base md:text-lg md:scale-110 transform transition ease-in-out duration-150") 
                           (href "https://wa.me/5585997491882"))
                   (i (@ (class "fab fa-whatsapp text-xl md:text-2xl"))) " Agende pelo WhatsApp"))
              
              (p (@ (class "text-xs text-white/60 max-w-xl mx-auto mt-6 leading-relaxed")) 
                 "Consulta médica especializada. A prescrição de Cannabis medicinal segue protocolo clínico individualizado e legislação vigente (RDC 660/2022 – ANVISA). O Dr. Marco Machado avaliará cada caso de forma ética e responsável.")))))

;;; Rodapé

(define (site-footer)
  `(footer (@ (class "text-center bg-[#0f261e] text-white/70 py-6 px-4 text-xs md:text-sm"))
          (div (@ (class "container mx-auto space-y-1"))
            (span "Prescrição de cannabis medicinal regulamentada pela ANVISA · RDC 660/2022")
            (br)
            (span "© 2026 Dr. Marco Machado. Todos os direitos reservados."))))

;;; Corpo do documento

(define (index-body)
  (list (whatsapp-btn)
        (hero-section)
        (acting-section)
        (conditions-section)
        (process-section)
        (doctor-section)
        (evidence-section)
        (cta-section)
        (site-footer)))
 
;;; Procedure que constroi a página --------------------------------------------------
 
(define (index-page site posts)
  (list
   (make-page "index.html"
              (default-layout
                #:title "Dr. Marco Antônio Machado — Medicina Canabinóide · Fortaleza, CE"
                #:description "Consultas médicas especializadas em Cannabis medicinal com abordagem integrativa e preventiva."
                #:body (index-body))
              sxml->html)))
