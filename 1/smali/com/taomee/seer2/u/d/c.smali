.class Lcom/taomee/seer2/u/d/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/u/d/a;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/d/a;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/d/c;->a:Lcom/taomee/seer2/u/d/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/u/d/c;->a:Lcom/taomee/seer2/u/d/a;

    invoke-static {v0}, Lcom/taomee/seer2/u/d/a;->a(Lcom/taomee/seer2/u/d/a;)Lcom/taomee/seer2/u/d/i;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/u/d/i;->setVisibility(I)V

    iget-object v0, p0, Lcom/taomee/seer2/u/d/c;->a:Lcom/taomee/seer2/u/d/a;

    invoke-static {v0}, Lcom/taomee/seer2/u/d/a;->a(Lcom/taomee/seer2/u/d/a;)Lcom/taomee/seer2/u/d/i;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/taomee/seer2/u/d/i;->setSelection(I)V

    return-void
.end method
