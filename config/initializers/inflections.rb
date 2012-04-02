# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
    inflect.irregular 'profissao', 'profissoes' 
    inflect.irregular 'tipo_de_selo', 'tipos_de_selos'
    inflect.irregular 'protocolo_imovel', 'protocolo_imoveis'
    inflect.irregular 'registro_geral', 'registro_gerais'
    inflect.irregular 'tipo_imovel', 'tipo_imoveis'
    inflect.irregular 'tipo_livro', 'tipo_livros'	
    inflect.irregular 'aquisicao', 'aquisicoes'
    inflect.irregular 'situacao', 'situacoes'	
    inflect.irregular 'indicador_real', 'indicadores_reais'	
	inflect.irregular 'proprietario','proprietarios'
 end
