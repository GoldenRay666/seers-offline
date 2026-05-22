.class Lcom/taomee/seer2/n/n;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/l;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/l;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/n;->a:Lcom/taomee/seer2/n/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/n/n;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->a(Lcom/taomee/seer2/n/l;)Lcom/taomee/seer2/n/a/a;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/n/a/a;->setVisibility(I)V

    iget-object v0, p0, Lcom/taomee/seer2/n/n;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->a(Lcom/taomee/seer2/n/l;)Lcom/taomee/seer2/n/a/a;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/taomee/seer2/n/a/a;->setSelection(I)V

    return-void
.end method
