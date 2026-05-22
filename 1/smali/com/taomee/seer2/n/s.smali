.class Lcom/taomee/seer2/n/s;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/r;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/r;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/s;->a:Lcom/taomee/seer2/n/r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/n/s;->a:Lcom/taomee/seer2/n/r;

    invoke-static {v0}, Lcom/taomee/seer2/n/r;->a(Lcom/taomee/seer2/n/r;)Lcom/taomee/seer2/n/t;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Lcom/taomee/seer2/n/t;->c(I)V

    return-void
.end method
