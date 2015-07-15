#  
# ====================================================
#  Docker Builder
# ----------------------------------------------------
# @file Makefile
# @date 2015.06.08
#
# ====================================================

# ワークスペース
w=$(realpath workspace)

# メタ情報
date=20150608
maintainer=nora

# ビルドする関数
build=cpp -P -o - $(1) |\
	sed -e -e 's/__DATE__/'$(date)'/' -e 's/__MAINTAINER__/$(maintainer)/' > $w/Dockerfile; \
	docker build -t $(2):$(date) $w; docker tag -f $(2):$(date) $(2):latest

# Archlinux
archlinux/%: nodes/archlinux/%.in
	$(call build,$<,$@)
archlinux/base: nodes/archlinux/base.in archlinux/mini
	$(call build,$<,archlinux/base)
archlinux/supervisor: nodes/archlinux/supervisor.in
	$(call build,$<,archlinux/supervisor)

# Service
service/%: nodes/service/%.in archlinux/supervisor
	$(call build,$<,$@)

# Nora
nora/%: nodes/nora/%.in
	$(call build,$<,$@)
