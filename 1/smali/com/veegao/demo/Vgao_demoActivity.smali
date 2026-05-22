.class public Lcom/veegao/demo/Vgao_demoActivity;
.super Landroid/app/Activity;
.source "Vgao_demoActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 17
    .local v1, "layout":Landroid/widget/LinearLayout;
    invoke-virtual {p0, v1}, Lcom/veegao/demo/Vgao_demoActivity;->setContentView(Landroid/view/View;)V

    .line 18
    invoke-static {p0}, Le22/c55/s88/VManager;->getInstance(Landroid/content/Context;)Le22/c55/s88/VManager;

    move-result-object v2

    const-string v3, "abc"

    invoke-virtual {v2, p0, v3}, Le22/c55/s88/VManager;->setVId(Landroid/content/Context;Ljava/lang/String;)V

    .line 19
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 20
    .local v0, "btn":Landroid/widget/Button;
    const-string v2, "\u70b9\u6211\u63a5\u6536\u5e7f\u544a\uff01"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 21
    new-instance v2, Lcom/veegao/demo/Vgao_demoActivity$1;

    invoke-direct {v2, p0}, Lcom/veegao/demo/Vgao_demoActivity$1;-><init>(Lcom/veegao/demo/Vgao_demoActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 29
    return-void
.end method
