.class Lcom/taomee/seer2/n/as;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/ar;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/ar;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/as;->a:Lcom/taomee/seer2/n/ar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Lcom/taomee/seer2/n/d/b;->T:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/taomee/seer2/n/as;->a:Lcom/taomee/seer2/n/ar;

    iget-object v1, v1, Lcom/taomee/seer2/n/ar;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/taomee/seer2/n/an;->b(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
