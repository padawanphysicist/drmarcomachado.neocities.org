;; pages/index.scm --- landing page content
(define-module (pages index)
  #:use-module (haunt page)
  #:use-module (haunt html)
  #:use-module (templates default)
  #:export (index-page))

;; --- small SXML helpers, one per repeated card type ------------------

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

;; --- page sections -----------------------------------------------------

(define (hero-section)
  `(section (@ (id "inicio") (class "hero-section section"))
          (img (@ (class "grafismo") (src "assets/img/grafismo.svg")))
          (div (@ (class "container section-container"))
            (div (@ (class "section-content hero-content"))
              (h1 "Saúde que vai à raiz.")
              (p "Consultas médicas especializadas em Cannabis medicinal com abordagem integrativa, preventiva e promotora de " 
                 (i "Qualidade de Vida.") " Ciência séria. Cuidado humano.")
              (ul (@ (class "ul-cta"))
                (li (a (@ (class "btn btn-primary btn-whatsapp") (href "https://wa.me/5585997491882"))
                       (i (@ (class "fab fa-whatsapp"))) " Agendar consulta pelo WhatsApp"))
                (li (a (@ (class "btn btn-secondary") (href "#area-atuacao")) 
                       "Saiba Mais" (i (@ (class "fas fa-arrow-down"))))))))))

;; (define (credibility-bar)
;;   `(div (@ (class "credibility-bar"))
;;      (span (@ (class "credibility-item"))
;;        (i (@ (class "fas fa-user-md icon-accent"))) " Médico formado pela UFC")
;;      (span (@ (class "credibility-item"))
;;        (i (@ (class "fas fa-prescription-bottle icon-accent")))
;;        " Mais de 5 anos prescrevendo cannabis medicinal")
;;      (span (@ (class "credibility-item"))
;;        (i (@ (class "fas fa-file-medical-alt icon-accent")))
;;        " Regulamentado conforme RDC 660/2022")
;;      (span (@ (class "credibility-item"))
;;        (i (@ (class "fas fa-check-circle icon-accent"))) " ANVISA")))

        

(define (acting-section)
  `(section (@ (id "area-atuacao") (class "section"))
          (div (@ (class "container section-container"))
            (div (@ (class "section-content"))
              (span (@ (class "eyebrow")) "Áreas de Atuação")
              (h2 (@ (class "section-title")) "O corpo tem um sistema próprio de equilíbrio. " (br) " A Cannabis medicinal sabe falar com ele.")
              (p (@ (class "section-description"))
                 "O Sistema Endocanabinoide humano regula o sono, a dor, o humor, a imunidade e a inflamação. Quando esse sistema está desequilibrado, surgem sintomas que muitas vezes resistem aos tratamentos convencionais. A Cannabis medicinal age diretamente nesse sistema — com crescente respaldo científico e prescrição médica individualizada.")
              (ul (@ (class "ul-cta"))
                (li (a (@ (class "btn btn-primary") (href "#condicoes-tratadas")) "Ver condições tratadas "))
                (li (a (@ (class "btn btn-secondary") (href "#sobre-o-processo")) "Saiba mais sobre o processo ")))))))

(define (conditions-section)
  `(section (@ (id "condicoes-tratadas") (class "section"))
          (div (@ (class "container section-container"))
            (div (@ (class "section-content"))
              (div (@ (class "condition-grid"))
                
                ;; Card 1
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-brain condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Doenças Neurodegenerativas")
                      (p (@ (class "condition-subtitle")) "Alzheimer, Parkinson, Esclerose Lateral Amiotrófica (ELA)")
                      (p (@ (class "condition-text")) "Os canabinóides têm ação neuroprotetora, anti-inflamatória e antioxidante comprovada em estudos clínicos. Auxiliam no controle de sintomas motores, agitação, distúrbios de sono e qualidade de vida de pacientes e cuidadores.")
                      (p (@ (class "condition-evidence")) "Evidência: estudos em modelos de Alzheimer mostram redução de placas amiloides e neuroinflamação com uso de CBD e THC combinados."))))
                
                ;; Card 2
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-puzzle-piece condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Neurodiversidade")
                      (p (@ (class "condition-subtitle")) "Autismo (TEA) e TDAH")
                      (p (@ (class "condition-text")) "Pesquisas israelenses e brasileiras apontam melhora significativa em irritabilidade, hiperatividade, ansiedade associada e qualidade do sono em crianças e adultos com TEA. No TDAH, a modulação dopaminérgica via canabinóides tem se mostrado promissora como adjuvante terapêutico.")
                      (p (@ (class "condition-evidence")) "Evidência: estudo publicado no Journal of Autism and Developmental Disorders (2019) relatou melhora em 80% dos pacientes com TEA tratados com CBD."))))

                ;; Card 3
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-bolt condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Epilepsia Refratária")
                      (p (@ (class "condition-text")) "Uma das indicações com maior respaldo científico disponível. O CBD foi o primeiro canabinóide a receber aprovação do FDA (EUA) para o tratamento de epilepsia — especificamente as síndromes de Dravet e Lennox-Gastaut. Estudos clínicos de fase III demonstraram redução de até 50% na frequência de crises.")
                      (p (@ (class "condition-evidence")) "Evidência: New England Journal of Medicine, 2018 — ensaio clínico randomizado controlado por placebo."))))

                ;; Card 4
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-heart condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Transtornos de Ansiedade e Depressão")
                      (p (@ (class "condition-text")) "O CBD atua nos receptores serotoninérgicos e no eixo HPA (estresse), com efeito ansiolítico demonstrado em estudos clínicos. O THC em baixas doses também tem papel na regulação do humor. Uma alternativa ou complemento para quem busca menos dependência de benzodiazepínicos e antidepressivos convencionais.")
                      (p (@ (class "condition-evidence")) "Evidência: revisão publicada no Neurotherapeutics (2015) confirma eficácia do CBD para múltiplos transtornos de ansiedade."))))

                ;; Card 5
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-fire condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Dores Crônicas e Fibromialgia")
                      (p (@ (class "condition-text")) "Canabinóides atuam nos receptores CB1 e CB2 do sistema nervoso central e periférico, modulando a percepção de dor e a inflamação sistêmica. Para pacientes com fibromialgia, dor neuropática, artrite reumatoide e dor oncológica, a cannabis medicinal representa uma alternativa eficaz com menor perfil de efeitos colaterais que opioides em uso prolongado.")
                      (p (@ (class "condition-evidence")) "Evidência: meta-análise publicada no JAMA (2015) — evidência moderada para dor crônica em adultos."))))

                ;; Card 6
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-moon condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Distúrbios do Sono")
                      (p (@ (class "condition-text")) "Insônia, sono fragmentado, apneia e ansiedade noturna. O CBD em doses moduladas demonstra melhora na arquitetura do sono — especialmente nas fases de sono profundo — sem o risco de dependência gerado por sedativos convencionais. O CBN (outro canabinóide) também apresenta potencial sedativo relevante.")
                      (p (@ (class "condition-evidence")) "Evidência: Permanente Journal (2019) — 66,7% dos pacientes relataram melhora do sono no primeiro mês."))))

                ;; Card 7
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-ribbon condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Suporte Oncológico")
                      (p (@ (class "condition-text")) "Reconhecida pela OMS e por diversas sociedades de oncologia como terapia de suporte, a cannabis medicinal auxilia no controle de náuseas e vômitos durante a quimioterapia, redução de dor, melhora do apetite e da qualidade de vida geral. Não substitui o tratamento oncológico, mas o humaniza.")
                      (p (@ (class "condition-evidence")) "Evidência: dois canabinóides sintéticos (Dronabinol e Nabilona) já são aprovados pelo FDA como antiéméticos oncológicos."))))

                ;; Card 8
                (div (@ (class "condition-card"))
                  (div (@ (class "condition-card-inner"))
                    (i (@ (class "fas fa-seedling condition-icon")))
                    (div
                      (h3 (@ (class "condition-title")) "Cannabis Preventiva (40+)")
                      (p (@ (class "condition-subtitle")) "Síndrome de Deficiência do Sistema Endocanabinoide")
                      (p (@ (class "condition-text")) "Após os 40 anos, o sistema endocanabinoide tende a perder tônus. A modulação preventiva com canabinóides pode apoiar o envelhecimento saudável — reduzindo inflamação sistêmica crônica de baixo grau, fortalecendo a imunidade, equilibrando hormônios e promovendo longevidade com qualidade. Cannabis como medicina preventiva, não só reativa.")
                      (p (@ (class "condition-evidence")) "Evidência: conceito de Deficiência Clínica do SEC descrito por Ethan Russo, Neuroendocrinology Letters (2008).")))))))))

(define (process-section)
  `(section (@ (id "sobre-o-processo") (class "section"))
          (div (@ (class "container section-container"))
            (div (@ (class "section-content"))
              (span (@ (class "eyebrow")) "O Processo")
              (h2 "Da dúvida à prescrição: um caminho seguro e individualizado.")
              (p "A prescrição de Cannabis medicinal no Brasil é legal, regulamentada pela ANVISA desde 2019 e exige acompanhamento médico. Não existe protocolo universal — cada paciente recebe uma indicação personalizada de produto, concentração e posologia.")
              (div (@ (class "process-grid"))
                (div (@ (class "process-card")) (span (@ (class "process-step")) "Passo 1") (h4 (@ (class "process-card-title")) "Agendamento") (p (@ (class "process-card-text")) "Atendimentos presenciais em Fortaleza e Cascavel (CE). Ou atendimentos online via videochamada."))
                (div (@ (class "process-card")) (span (@ (class "process-step")) "Passo 2") (h4 (@ (class "process-card-title")) "Anamnese Completa") (p (@ (class "process-card-text")) "Consulta detalhada com histórico clínico, medicações em uso, exames, estilo de vida e objetivos terapêuticos. O Dr. Marco escuta antes de prescrever."))
                (div (@ (class "process-card")) (span (@ (class "process-step")) "Passo 3") (h4 (@ (class "process-card-title")) "Prescrição Individualizada") (p (@ (class "process-card-text")) "Indicação do produto canabinóide adequado ao seu caso: tipo de canabinóide (CBD, THC, full spectrum), concentração, forma farmacêutica e posologia."))
                (div (@ (class "process-card")) (span (@ (class "process-step")) "Passo 4") (h4 (@ (class "process-card-title")) "Acompanhamento Continuado") (p (@ (class "process-card-text")) "Retornos periódicos para ajuste de dosagem, avaliação de resultados e adequação do tratamento à sua evolução clínica.")))
              (div (@ (class "highlight-box"))
                (div (@ (class "highlight-grid"))
                  (div (@ (class "highlight-item")) (i (@ (class "fas fa-check-circle highlight-icon"))) "Receituário de controle especial conforme RDC 660/2022")
                  (div (@ (class "highlight-item")) (i (@ (class "fas fa-check-circle highlight-icon"))) "Dosagem individualizada — não existe \"receita padrão\"")
                  (div (@ (class "highlight-item")) (i (@ (class "fas fa-check-circle highlight-icon"))) "Sigilo e ética médica garantidos em todo o processo")
                  (div (@ (class "highlight-item highlight-item-wide")) (i (@ (class "fas fa-check-circle highlight-icon"))) "Atendimento presencial em Fortaleza e Cascavel (CE)")
                  (div (@ (class "highlight-item highlight-item-wide")) (i (@ (class "fas fa-check-circle highlight-icon"))) "Atendimento online via videochamada")))
              (ul (@ (class "ul-cta "))
                (li (a (@ (class "btn btn-primary") (href "#o-medico")) "Saiba mais sobre o médico ")))))))

(define (doctor-section)
  `(section (@ (id "o-medico") (class "section"))
          (div (@ (class "container section-container"))
            (div (@ (class "section-content"))
              (div (@ (class "split"))
                (div (@ (class "left-side"))
                  (span (@ (class "eyebrow")) "Quem é o médico")
                  (h2 (@ (class "section-title")) "Uma vida inteira dedicada à saúde integral.")
                  (div (@ (class "doctor-card"))
                    (div (@ (class "quote-mark")) "“")
                    (p (@ (class "doctor-quote")) "Minha atuação clínica é focada na saúde integral, preventiva e promotora de qualidade de vida.")
                    (p (@ (class "doctor-quote-author")) "— Dr. Marco Antônio Machado"))
                  (div (@ (class "doctor-bio"))
                    (p "Marco Antônio Machado, nascido em 2 de Dezembro de 1960, é médico formado pela Universidade Federal do Ceará (UFC). É concursado no município de Cascavel (CE), onde trabalha há mais de 20 anos na Atenção Primária à Saúde.")
                    (p "Sua atuação clínica sempre foi orientada pela saúde integral — não pelo sintoma isolado, mas pelo ser humano como um todo (Visão Sistêmica da Vida).")
                    (p "Há mais de 5 anos, é um dos médicos pioneiros na prescrição de Cannabis medicinal no Ceará, e testemunha diária das transformações na vida de crianças com autismo à idosos com Alzheimer e Parkinson — experiências que aprofundaram sua convicção sobre o potencial terapêutico dos canabinóides quando prescritos com responsabilidade e ciência.")
                    (p "Além de médico, é avô de 12 netos e agroflorestador na Pachamama. Gosta de plantar árvores, água, ar e sonhos."))
                  (div (@ (class "tag-list"))
                    (span (@ (class "tag")) "Medicina Integrativa")
                    (span (@ (class "tag")) "Cannabis Medicinal")
                    (span (@ (class "tag")) "Saúde Preventiva")
                    (span (@ (class "tag")) "Neurologia Funcional")
                    (span (@ (class "tag")) "Atenção Primária")
                    (span (@ (class "tag")) "Longevidade")))
                (div (@ (class "right-side"))
                  (img (@ (src "https://placehold.co/500x750?text=Fotografia")))))))))

(define (evidence-section)
  `(section (@ (id "evidencias") (class "section"))
             (div (@ (class "container section-container"))
                  (div (@ (class "section-content"))
                       (span (@ (class "eyebrow")) "Ciência")
                       (h2 (@ (class "section-title")) "Não é alternativo. É medicina com evidência.")
                       (div (@ (class "stats-grid"))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "870.000+")
                                 (div (@ (class "evidence-label")) "Pacientes com autorização para Cannabis medicinal no Brasil" 
                                      (span (@ (class "evidence-source")) "ANVISA · 2024")))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "50%")
                                 (div (@ (class "evidence-label")) "Redução de crises em epilepsia refratária com CBD" 
                                      (span (@ (class "evidence-source")) "New England Journal of Medicine · 2018")))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "30+")
                                 (div (@ (class "evidence-label")) "Países com cannabis medicinal regulamentada" 
                                      (span (@ (class "evidence-source")) "EUA, Canadá, Alemanha, Israel, Portugal e outros")))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "1992")
                                 (div (@ (class "evidence-label")) "Descoberta do sistema endocanabinoide humano por Raphael Mechoulam" 
                                      (span (@ (class "evidence-source")) "A base científica que mudou a medicina")))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "2018")
                                 (div (@ (class "evidence-label")) "Aprovação do primeiro medicamento canabinóide pelo FDA para epilepsia" 
                                      (span (@ (class "evidence-source")) "Epidiolex — CBD puro")))
                            (div (@ (class "evidence-card"))
                                 (div (@ (class "evidence-number")) "5 anos")
                                 (div (@ (class "evidence-label")) "De experiência clínica do Dr. Marco com Cannabis medicinal no Ceará")))
                       (ul (@ (class "ul-cta"))
                           (a (@ (class "btn btn-primary") (href "#agende-sua-consulta")) "Agende sua Consulta"))))))

(define (cta-section)
  `(section (@ (id "agende-sua-consulta") (class "section"))
            (div (@ (class "container section-container"))
                 (div (@ (class "section-content"))
                      (h1 "O primeiro passo é uma conversa.")
                      (img (@ (class "separador") (src "assets/img/separador.svg")))
                      (p "Uma consulta com o Dr. Marco é mais do que uma prescrição. É o início de um cuidado médico que vê você como um todo — sua história, seu corpo, sua vida. Vagas limitadas. Atendimentos presenciais em Fortaleza e Cascavel (CE). Ou atendimentos online via videochamada.")
                      (a (@ (class "btn btn-primary btn-whatsapp btn-cta") (href "https://wa.me/5585997491882"))
                         (i (@ (class "fab fa-whatsapp"))) " Agende pelo WhatsApp")
                      (p (@ (class "cta-disclaimer")) 
                         "Consulta médica especializada. A prescrição de Cannabis medicinal segue protocolo clínico individualizado e legislação vigente (RDC 660/2022 – ANVISA). O Dr. Marco Machado avaliará cada caso de forma ética e responsável.")))))

(define (site-footer)
  `(footer (@ (class "footer"))
           (div (@ (class "container"))
                (span "Prescrição de cannabis medicinal regulamentada pela ANVISA · RDC 660/2022")
                (br)
                (span "© 2026 Dr. Marco Machado. Todos os direitos reservados."))))


(define (index-body)
  (list (hero-section)
        (acting-section)
        (conditions-section)
        (process-section)
        (doctor-section)
        (evidence-section)
        (cta-section)
        (site-footer)))
 
;; --- Haunt page builder --------------------------------------------------
 
(define (index-page site posts)
  (list
   (make-page "index.html"
              (default-layout
                #:title "Dr. Marco Antônio Machado — Medicina Canabinóide · Fortaleza, CE"
                #:description "Consultas médicas especializadas em Cannabis medicinal com abordagem integrativa e preventiva."
                #:body (index-body))
              sxml->html)))
